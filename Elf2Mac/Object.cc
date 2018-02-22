/*
	 Copyright 2017 Wolfgang Thaller.

	 This file is part of Retro68.

	 Retro68 is free software: you can redistribute it and/or modify
	 it under the terms of the GNU General Public License as published by
	 the Free Software Foundation, either version 3 of the License, or
	 (at your option) any later version.

	 Retro68 is distributed in the hope that it will be useful,
	 but WITHOUT ANY WARRANTY; without even the implied warranty of
	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	 GNU General Public License for more details.

	 You should have received a copy of the GNU General Public License
	 along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "Object.h"
#include "Symbol.h"
#include "Symtab.h"
#include "Section.h"
#include "SegmentMap.h"
#include "Reloc.h"

#include <err.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fstream>
#include <sstream>
#include <iostream>

#include <boost/algorithm/string/predicate.hpp>
#include <boost/lexical_cast.hpp>

#include "ResourceFork.h"
#include "BinaryIO.h"
#include "ResourceFile.h"

using std::string;
using std::shared_ptr;
using std::make_shared;
using std::ofstream;
using std::unordered_map;
using std::vector;

Object::~Object()
{
}

Object::Object(string input)
{
	if(elf_version ( EV_CURRENT ) == EV_NONE)
		errx(EXIT_FAILURE , "ELF library initialization failed: %s", elf_errmsg( -1));

	int fd = open(input.c_str(), O_RDONLY, 0);
	elf = elf_begin(fd, ELF_C_READ, NULL);

	elf_getshdrstrndx(elf, &sectionHeaderStringTableIdx);

	GElf_Ehdr ehdr;
	gelf_getehdr(elf, &ehdr);

	int idx;

	idx = 1;
	for(Elf_Scn *scn = NULL; (scn = elf_nextscn(elf, scn)) != NULL; idx++)
	{
		GElf_Shdr shdr;
		gelf_getshdr(scn, &shdr);
		std::string name = elf_strptr(elf, sectionHeaderStringTableIdx, shdr.sh_name);
		if(shdr.sh_type == SHT_STRTAB)
		{
			if(name == ".strtab")
				mainStringTableIdx = idx;
		}
	}

	idx = 1;
	for(Elf_Scn *scn = NULL; (scn = elf_nextscn(elf, scn)) != NULL; idx++)
	{
		GElf_Shdr shdr;
		gelf_getshdr(scn, &shdr);
		std::string name = elf_strptr(elf, sectionHeaderStringTableIdx, shdr.sh_name);
		//std::cout << "section #" << idx << ": " << name << std::endl;
		//std::cout << "        =" << shdr.sh_addr << " + " << shdr.sh_size << std::endl;

		if(shdr.sh_type == SHT_SYMTAB
		            && !symtab)
		{
			symtab.reset(new Symtab(*this, scn));
		}
		if(shdr.sh_type == SHT_RELA)
		{
			if(boost::algorithm::starts_with(name,".rela."))
			{
				string progbitsName = name.substr(5);
				assert(sections.find(progbitsName) != sections.end());
				sections[progbitsName]->SetRela(scn);
			}
		}
		if(shdr.sh_type == SHT_PROGBITS && (shdr.sh_flags & SHF_ALLOC))
		{
			SectionKind kind = SectionKind::code;

			if(name == ".data")
				kind = SectionKind::data;
			if(name == ".strippedmacsbugnames")
				kind = SectionKind::undefined;

			auto section = make_shared<Section>(*this, name, idx, kind, scn);

			sections[name] = sectionsByElfIndex[idx] = section;
			if(kind == SectionKind::data)
				dataSection = section;
			else if(kind == SectionKind::code)
				codeSections.push_back(section);
		}
		if(shdr.sh_type == SHT_NOBITS)
		{
			bssSection = sections[name] = sectionsByElfIndex[idx] =
			        make_shared<Section>(*this, name, idx, SectionKind::bss, scn);
		}
	}

	std::sort(codeSections.begin(), codeSections.end(),
	          [](shared_ptr<Section> a, shared_ptr<Section> b) { return a->name < b->name; });
}

void Object::FlatCode(std::ostream& out)
{
	for(auto sec : codeSections)
	{
		sec->FixRelocs(true);
		out << sec->GetData();
	}
		
	dataSection->FixRelocs(true);
	out << dataSection->GetData();

	std::vector<RuntimeReloc> relocs;
	for(auto sec : codeSections)
	{
		auto tmp = sec->GetRelocations(false);
		relocs.insert(relocs.end(), tmp.begin(), tmp.end());
	}
	{
		auto tmp = dataSection->GetRelocations(false);
		relocs.insert(relocs.end(), tmp.begin(), tmp.end());
	}
	out << SerializeRelocs(relocs);
}

void Object::FlatCode(string fn)
{
	ofstream out(fn);
	FlatCode(out);
}


std::string fromhex(std::string hex)
{
	std::string bin;
	int nibble;
	bool haveNibble = false;
	for(std::string::iterator p = hex.begin(); p != hex.end(); ++p)
	{
		if(std::isspace(*p))
			continue;
		assert(isdigit(*p) || (tolower(*p) >= 'a' && tolower(*p) <= 'f'));
		int digit;
		if(isdigit(*p))
			digit = *p - '0';
		else
			digit = tolower(*p) - 'a' + 0xA;

		if(haveNibble)
		{
			bin += (char) ((nibble << 4) | digit);
			haveNibble = false;
		}
		else
		{
			nibble = digit;
			haveNibble = true;
		}
	}
	return bin;
}



void Object::SingleSegmentApp(string output)
{
	ResourceFile file(output);
	Resources& rsrc = file.resources;

	rsrc.addResource(Resource(ResType("CODE"), 0,
	    fromhex(
	        "00000028 00000000 00000008 00000020"
	        "0000 3F3C 0001 A9F0"
	    )
	));


	{
		std::ostringstream code1;
		word(code1, 0);
		word(code1, 1);
		FlatCode(code1);

		rsrc.addResource(Resource(ResType("CODE"), 1,
		                          code1.str()));
	}

	file.creator = ResType("????");
	file.type = ResType("APPL");

	file.write();
}



void Object::MultiSegmentApp(string output, SegmentMap& segmentMap)
{
    bool noisy = false;
    
	ResourceFile file(output);
	Resources& rsrc = file.resources;

	for(auto namedSec : sections)
	{
		namedSec.second->ScanRelocs();
	}

	int jtEntryCount = 0;
	unordered_map<int, vector<Symbol*>> jtEntries;
	for(Symbol& sym : symtab->symbols)
	{
		if(sym.valid)
		{
			if(sym.referencedExternally && sym.sectionKind == SectionKind::code)
			{
				sym.needsJT = true;
				sym.jtIndex = -1;
				sym.section->jtEntries.push_back(&sym);
				++jtEntryCount;
			}
		}
	}

	uint32_t data_and_bss_size = dataSection->shdr.sh_size + bssSection->shdr.sh_size;

	{
		std::ostringstream code0;
		longword(code0, 0x20 + 8 * (jtEntryCount+2));
		longword(code0, data_and_bss_size);
		longword(code0, 8 * (jtEntryCount+2));
		longword(code0, 0x20);

		code0 << fromhex("0000 3F3C 0001 A9F0");	// jt entry for entrypoint
		code0 << fromhex("0000 FFFF 0000 0000");	// 32-bit entries start from here

		int jtIndex = 2;
		int id = 1;
		for(auto sec : codeSections)
		{
			sec->codeID = id;

			sec->firstJTEntryIndex = jtIndex;

			GElf_Shdr &shdr = sec->shdr;

			for(Symbol* jtEntry : sec->jtEntries)
			{
				word(code0, id);
				word(code0, 0xA9F0);
				uint32_t offset = jtEntry->st_value - shdr.sh_addr;
				if(id == 1)
					offset += 4;
				else
					offset += 40;
				longword(code0, offset);

				jtEntry->jtIndex = jtIndex++;

				//std::cout << "JT Entry " << jtEntry->jtIndex << ": " << jtEntry->name << std::endl;
			}

			id++;
		}

        if(noisy)
        {
            std::cout << "CODE 0: " << code0.str().size() << " bytes\n";
            std::cout << "above A5: " << 0x20 + 8 * (jtEntryCount+2) << " bytes\n";
            std::cout << "below A5: " << data_and_bss_size << " bytes\n";
            std::cout << ".data: " << dataSection->shdr.sh_size << " bytes at A5-"
                        << std::hex << data_and_bss_size << std::dec << "\n";
            std::cout << ".bss: " << bssSection->shdr.sh_size << " bytes at A5-"
                        << std::hex << bssSection->shdr.sh_size << std::dec << "\n";
        }
		rsrc.addResource(Resource(ResType("CODE"), 0, code0.str()));
	}

	for(auto sec : codeSections)
	{
		int id = sec->codeID;
		if(id == 1)
			sec->outputBase = 4;	// standard 'CODE' header
		else
			sec->outputBase = 40;	// far-model 'CODE' header

		string exceptionInfoMarker = "__EH_FRAME_BEGIN__";
		if(id != 1)
			exceptionInfoMarker += boost::lexical_cast<string>(id);
		int exceptionInfoSym = symtab->FindSym(exceptionInfoMarker);
		if(exceptionInfoSym != -1)
		{
			Symbol& s = symtab->GetSym(exceptionInfoSym);
			sec->exceptionInfoStart = s.st_value;

			int codeSize = sec->shdr.sh_size;
			int exceptionSize = sec->shdr.sh_addr + codeSize - sec->exceptionInfoStart;
			double percent = 100.0 * exceptionSize / codeSize;

			if(noisy)
                std::cout << "CODE " << id << " has " << exceptionSize << " bytes of exception info (" << percent << "%)\n";
		}
		else if(noisy)
			std::cout << "exception info marker not found: " << exceptionInfoMarker << std::endl;
	}
	dataSection->outputBase = -data_and_bss_size;
	bssSection->outputBase = -bssSection->shdr.sh_size;


	for(auto namedSec : sections)
	{
		namedSec.second->FixRelocs(false);
	}

	for(auto sec : codeSections)
	{
		int id = sec->codeID;
		std::ostringstream code;
		if(id == 1)
		{
			word(code, 0);
			word(code, 1);
		}
		else
		{
			word(code, 0xFFFF);
			word(code, 0);
			longword(code, 0);
			longword(code, 0);
			longword(code, 8 * sec->firstJTEntryIndex );
			longword(code, sec->jtEntries.size());
			longword(code, 0);	// reloc info for A5
			longword(code, 0);	// assumed address for A5
			longword(code, 0);	// reloc info for code
			longword(code, 0);	// assumed address for start of code resource
			longword(code, 0);
		}
		code << sec->GetData();

        if(noisy)
        {
            std::cout << "CODE " << id << ": " << code.str().size() << " bytes\n";

            if(code.str().size() == 80)
            {
                std::cout << "... empty. Skipping.\n";
                continue;
            }
        }

		string segmentName = segmentMap.GetSegmentName(id);

		rsrc.addResource(Resource(ResType("CODE"), id,
		                          code.str(),
		                          segmentName));


		rsrc.addResource(Resource(ResType("RELA"),id, SerializeRelocs(sec->GetRelocations(true))));
	}

	rsrc.addResource(Resource(ResType("DATA"),0, dataSection->GetData()));
	rsrc.addResource(Resource(ResType("RELA"),0, SerializeRelocs(dataSection->GetRelocations(true))));

    if(noisy)
	    std::cout << "DATA 0: " << dataSection->shdr.sh_size << " bytes\n";

	file.creator = ResType("????");
	file.type = ResType("APPL");

	file.write();
}
