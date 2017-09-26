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

#include "Elf2Mac.h"

#include "ResourceFork.h"
#include "BinaryIO.h"
#include "ResourceFile.h"

#include <gelf.h>

#include <err.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <string>
#include <unordered_map>
#include <map>
#include <vector>
#include <fstream>
#include <iostream>
#include <sstream>
#include <memory>

#include <boost/algorithm/string/predicate.hpp>

using std::string;
using std::unordered_map;
using std::map;
using std::vector;
using std::ofstream;
using std::shared_ptr;
using std::make_shared;
using std::unique_ptr;
using std::pair;
using std::make_pair;

size_t sectionHeaderStringTableIdx;
size_t mainStringTableIdx = (size_t)-1;

class Symtab;
class Section;

Elf *elf;
std::vector<int> relocs;
unique_ptr<Symtab> symtab;
unordered_map<string, shared_ptr<Section>> sections;
unordered_map<int, shared_ptr<Section>> sectionsByElfIndex;

std::vector<shared_ptr<Section>> codeSections;
shared_ptr<Section> dataSection, bssSection;

enum class SectionKind
{
	undefined = -1,
	code = 0,
	data,
	bss
};

enum class RelocBase
{
	code = 0,
	data,
	bss,
	jumptable,
	code1
};

class Symbol : public GElf_Sym
{
public:
	bool valid;
	bool referencedExternally;
	SectionKind sectionKind;
	bool needsJT;
	int jtIndex;
	shared_ptr<Section> section;

	Symbol();
	Symbol(const GElf_Sym& sym);

	string GetName();
};

class Symtab
{
public:
	Elf_Scn *elfsec;
	Elf_Data *data;
	vector<Symbol> symbols;
	map<pair<int,uint32_t>, int> symbolsByAddress;

	Symtab(Elf_Scn *elfsec);

	Symbol& GetSym(int idx);
	int FindSym(int secidx, uint32_t addr);
};

class Reloc : public GElf_Rela
{
public:
	RelocBase relocBase;

	Reloc();
	Reloc(const GElf_Rela& rela);
};

class Section
{
public:
	string name;
	int idx;
	SectionKind kind;
	Elf_Scn *elfsec, *relasec;
	Elf_Data *data;
	GElf_Shdr shdr;
	uint32_t outputBase;

	int codeID;

	std::vector<Reloc> relocs;
	std::vector<Symbol*> jtEntries;
	int firstJTEntryIndex;

	Section(string name, int idx, SectionKind kind, Elf_Scn *elfsec);
	void SetRela(Elf_Scn *scn);

	uint32_t GetSize();
	string GetData();
	string GetAbsRelocations(bool useOffsets, bool suppressTerminatingEntry = false);

	void ScanRelocs();
	void FixRelocs();

};

Symbol::Symbol()
    : valid(false)
{
}

Symbol::Symbol(const GElf_Sym &sym)
    : GElf_Sym(sym), valid(true),
      referencedExternally(false),
      sectionKind(SectionKind::undefined),
      needsJT(false)
{
	if(st_shndx != SHN_UNDEF && st_shndx < SHN_LORESERVE)
	{
		section = sectionsByElfIndex[st_shndx];
		sectionKind = section->kind;
	}
}

string Symbol::GetName()
{
	return elf_strptr(elf, mainStringTableIdx, st_name);
}

Symtab::Symtab(Elf_Scn *elfsec)
    : elfsec(elfsec)
{
	data = elf_getdata(elfsec, NULL);

	GElf_Shdr shdr;
	gelf_getshdr(elfsec, &shdr);

	int count = shdr.sh_size / shdr.sh_entsize;
	symbols.reserve(count);

	for(int i = 0; i < count; i++)
	{
		GElf_Sym sym;
		auto res = gelf_getsym(data, i, &sym);
		assert(res != 0);
		symbols.emplace_back(sym);

		if(sym.st_shndx != SHN_UNDEF && sym.st_shndx < SHN_LORESERVE)
			symbolsByAddress[make_pair((int)sym.st_shndx,sym.st_value)] = i;
	}
}

Symbol &Symtab::GetSym(int idx)
{
	return symbols[idx];
}

int Symtab::FindSym(int secidx, uint32_t addr)
{
	auto p = symbolsByAddress.find(make_pair(secidx, addr));
	if(p != symbolsByAddress.end())
		return p->second;
	else
		return -1;
}


Reloc::Reloc()
{
}

Reloc::Reloc(const GElf_Rela &rela)
    : GElf_Rela(rela)
{
}

Section::Section(string name, int idx, SectionKind kind, Elf_Scn *elfsec)
    : name(name), idx(idx), kind(kind), elfsec(elfsec), relasec(NULL),
      codeID(-1), firstJTEntryIndex(0)
{
	data = elf_getdata(elfsec, NULL);
	gelf_getshdr(elfsec, &shdr);
	outputBase = shdr.sh_addr;
}


void Section::SetRela(Elf_Scn *scn)
{
	relasec = scn;
	GElf_Shdr shdr;
	gelf_getshdr(relasec, &shdr);

	int nRela = shdr.sh_size / shdr.sh_entsize;
	Elf_Data *data = elf_getdata(relasec, NULL);
	for(int i = 0; i < nRela; i++)
	{
		GElf_Rela rela;
		gelf_getrela(data, i, &rela);
		relocs.push_back(rela);
	}

	std::sort(relocs.begin(), relocs.end(),
	          [](GElf_Rela& a, GElf_Rela& b) { return a.r_offset < b.r_offset; });
}

uint32_t Section::GetSize()
{
	return data->d_size;
}

string Section::GetData()
{
	return string((char*)data->d_buf, (char*)data->d_buf + data->d_size);
}

string Section::GetAbsRelocations(bool useOffsets, bool suppressTerminatingEntry)
{
	std::ostringstream out;

	for(auto& rela : relocs)
	{
		//printf("rel: %d %d %x %x\n", (int)GELF_R_TYPE(rela.r_info), (int)GELF_R_SYM(rela.r_info), (unsigned)rela.r_addend, (unsigned)rela.r_offset);

		int symidx = GELF_R_SYM(rela.r_info);
		if(symidx == 0)
			continue;

		Symbol& sym = symtab->GetSym(symidx);

		if(sym.st_shndx == SHN_UNDEF || sym.st_shndx >= SHN_LORESERVE)
			continue;
		if(sym.sectionKind == SectionKind::undefined)
			continue;

		if(GELF_R_TYPE(rela.r_info) == R_68K_32)
		{
			assert(sym.sectionKind != SectionKind::undefined);

			uint32_t offset = rela.r_offset;
			if(useOffsets)
				offset -= shdr.sh_addr;

			std::cout << "RELA: " << std::hex << offset << " " << (int)rela.relocBase << std::dec << std::endl;
			longword(out, offset | ((int)rela.relocBase << 24));
		}
	}
	if(!suppressTerminatingEntry)
		longword(out, -1);
	return out.str();
}

void Section::ScanRelocs()
{
	for(Reloc& rela : relocs)
	{
		int symidx = GELF_R_SYM(rela.r_info);
		if(symidx == 0)
			continue;

		Symbol *sym = &symtab->GetSym(symidx);

		if(sym->st_shndx == SHN_UNDEF)
			continue;

		if(rela.r_addend != 0)
		{
			int symidx2 = symtab->FindSym(sym->st_shndx, sym->st_value + rela.r_addend);
			if(symidx2 != -1)
			{
				sym = &symtab->GetSym(symidx2);
				rela.r_addend = 0;
				rela.r_info = GELF_R_INFO(symidx2, GELF_R_TYPE(rela.r_info));

			}
		}

		if(sym->st_shndx != idx)
			sym->referencedExternally = true;
	}
}

void Section::FixRelocs()
{
	//bool first_reloc = true;
	for(Reloc& rela : relocs)
	{
		if(GELF_R_TYPE(rela.r_info) != R_68K_32)
			continue;

		int symidx = GELF_R_SYM(rela.r_info);
		if(symidx == 0)
			continue;
		Symbol& sym = symtab->GetSym(symidx);

		if(sym.sectionKind == SectionKind::undefined)
			continue;

		RelocBase relocBase;
		switch(sym.sectionKind)
		{
			case SectionKind::code:
				relocBase = RelocBase::code;
				if(sym.needsJT)
				{
					if(rela.r_addend == 0)
					{
						relocBase = RelocBase::jumptable;
					}
					else
					{
						if(sym.section.get() != this)
						{
							std::cerr << "Invalid ref from "
							          << name << ":" << std::hex << rela.r_offset-shdr.sh_addr << std::dec
							          << " to " << sym.section->name
							          << "(" << sym.GetName() << ")"
							          << "+" << rela.r_offset << std::endl;
						}
						assert(sym.section.get() == this);
					}
				}
				else
					assert(sym.section.get() == this);
				break;
			case SectionKind::data:
				relocBase = RelocBase::data;
				break;
			case SectionKind::bss:
				relocBase = RelocBase::bss;
				break;
		}
		rela.relocBase = relocBase;

		uint8_t *relocand = ((uint8_t*) data->d_buf + rela.r_offset - shdr.sh_addr);
		/*if(first_reloc)
		{
			std::cout << "sec kind: " << (int)sym.sectionKind << std::endl;
			std::cout << "reloc addr:" << rela.r_offset << std::endl;
		}*/


		if(relocBase == RelocBase::jumptable)
		{
			uint32_t dst = 0x20 + sym.jtIndex * 8 + 2;
			relocand[0] = dst >> 24;
			relocand[1] = dst >> 16;
			relocand[2] = dst >> 8;
			relocand[3] = dst;
		}
		else
		{
			uint32_t orig = (relocand[0] << 24) | (relocand[1] << 16) | (relocand[2] << 8) | relocand[3];
			uint32_t dst = orig + sym.section->outputBase - sym.section->shdr.sh_addr;
			relocand[0] = dst >> 24;
			relocand[1] = dst >> 16;
			relocand[2] = dst >> 8;
			relocand[3] = dst;
		}
	}
}


void GrokELF(string input)
{
	if(elf_version ( EV_CURRENT ) == EV_NONE)
		errx(EXIT_FAILURE , "ELF library initialization failed: %s", elf_errmsg( -1));

	int fd = open(input.c_str(), O_RDONLY, 0);
	elf = elf_begin(fd, ELF_C_READ, NULL);

	elf_getshdrstrndx(elf, &sectionHeaderStringTableIdx);

	GElf_Ehdr ehdr;
	gelf_getehdr(elf, &ehdr);

	int idx = 1;
	for(Elf_Scn *scn = NULL; (scn = elf_nextscn(elf, scn)) != NULL; idx++)
	{
		GElf_Shdr shdr;
		gelf_getshdr(scn, &shdr);
		std::string name = elf_strptr(elf, sectionHeaderStringTableIdx, shdr.sh_name);
		//std::cout << "section #" << idx << ": " << name << std::endl;

		if(shdr.sh_type == SHT_SYMTAB
		            && !symtab)
		{
			symtab.reset(new Symtab(scn));
		}
		if(shdr.sh_type == SHT_STRTAB)
		{
			if(name == ".strtab")
				mainStringTableIdx = idx;
		}
		if(shdr.sh_type == SHT_RELA
		        && !bssSection)	// ignore everything after bss, that's just debug info
		{
			if(boost::algorithm::starts_with(name,".rela."))
			{
				string progbitsName = name.substr(5);
				assert(sections.find(progbitsName) != sections.end());
				sections[progbitsName]->SetRela(scn);
			}
		}
		if(shdr.sh_type == SHT_PROGBITS
		        && !bssSection)	// ignore everything after bss, that's just debug info
		{
			SectionKind kind = name == ".data" ? SectionKind::data : SectionKind::code;
			auto section = make_shared<Section>(name, idx, kind, scn);

			sections[name] = sectionsByElfIndex[idx] = section;
			if(kind == SectionKind::data)
				dataSection = section;
			else if(kind == SectionKind::code)
				codeSections.push_back(section);
		}
		if(shdr.sh_type == SHT_NOBITS)
		{
			// Currently, the bss section is used
			// to know when to start skipping debug info sections.
			// (What's the official way to distinguish a debug info section from a "real" section?)

			bssSection = sections[name] = sectionsByElfIndex[idx] =
			        make_shared<Section>(name, idx, SectionKind::bss, scn);
		}
	}

	std::sort(codeSections.begin(), codeSections.end(),
	          [](shared_ptr<Section> a, shared_ptr<Section> b) { return a->name < b->name; });
}

void FlatCode(std::ostream& out)
{
	for(auto sec : codeSections)
		out << sec->GetData();

	out << dataSection->GetData();

	for(auto sec : codeSections)
		out << sec->GetAbsRelocations(false, true);
	out << dataSection->GetAbsRelocations(false);

}

void FlatCode(string fn)
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



void SingleSegmentApp(string output)
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



void MultiSegmentApp(string output)
{
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

				//std::cout << "JT Entry " << jtEntry->jtIndex << ": " << jtEntry->GetName() << std::endl;
			}

			id++;
		}

		std::cout << "CODE 0: " << code0.str().size() << " bytes\n";
		std::cout << "above A5: " << 0x20 + 8 * (jtEntryCount+2) << " bytes\n";
		std::cout << "below A5: " << data_and_bss_size << " bytes\n";
		std::cout << ".data: " << dataSection->shdr.sh_size << " bytes at A5-"
		            << std::hex << data_and_bss_size << std::dec << "\n";
		std::cout << ".bss: " << bssSection->shdr.sh_size << " bytes at A5-"
		            << std::hex << bssSection->shdr.sh_size << std::dec << "\n";

		rsrc.addResource(Resource(ResType("CODE"), 0, code0.str()));
	}

	for(auto sec : codeSections)
	{
		int id = sec->codeID;
		if(id == 1)
			sec->outputBase = 4;	// standard 'CODE' header
		else
			sec->outputBase = 40;	// far-model 'CODE' header
	}
	dataSection->outputBase = -data_and_bss_size;
	bssSection->outputBase = -bssSection->shdr.sh_size;


	for(auto namedSec : sections)
	{
		namedSec.second->FixRelocs();
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

		std::cout << "CODE " << id << ": " << code.str().size() << " bytes\n";

		rsrc.addResource(Resource(ResType("CODE"), id,
		                          code.str()));


		rsrc.addResource(Resource(ResType("RELA"),id, sec->GetAbsRelocations(true)));
	}

	rsrc.addResource(Resource(ResType("DATA"),0, dataSection->GetData()));
	rsrc.addResource(Resource(ResType("RELA"),0, dataSection->GetAbsRelocations(true)));

	std::cout << "DATA 0: " << dataSection->shdr.sh_size << " bytes\n";

	file.creator = ResType("????");
	file.type = ResType("APPL");

	file.write();
}

string argvZero;

void RealLD(vector<string> args)
{
	vector<const char*> argv;
	string realLD = argvZero + ".real";
	argv.push_back(realLD.c_str());
	for(string& s : args)
		argv.push_back(s.c_str());
	argv.push_back(NULL);

	pid_t pid = fork();
	if(pid < 0)
	{
		perror("unable to fork");
		exit(-1);
	}
	else if(pid == 0)
	{
		execvp(argv[0], const_cast<char* const *> (argv.data()));
		perror("exec failed");
		exit(-1);
	}
	else
	{
		int wstatus;
		int result = 0;
		do
		{
			result = waitpid(pid, &wstatus, 0);
		} while(result == -1 && errno == EINTR);
		if(!WIFEXITED(wstatus))
		{
			errx(EXIT_FAILURE, "ld process did not exit properly");
		}
		else
		{
			int exitcode = WEXITSTATUS(wstatus);
			if(exitcode)
				exit(exitcode);
		}
	}

}

int main(int argc, char *argv[])
{
	vector<string> args;
	std::copy(argv + 1, argv+argc, std::back_inserter(args));
	argvZero = argv[0];

	if(boost::algorithm::ends_with(argv[0], "ld"))
	{
		string outputFile = "a.out";
		bool elf2mac = false;
		bool flatoutput = false;
		bool segments = true;

		vector<string> args2;
		for(auto p = args.begin(), e = args.end(); p != e; ++p)
		{
			if(*p == "-o")
			{
				++p;
				if(p == e)
					errx(EXIT_FAILURE, "-o missing argument");
				outputFile = *p;
			}
			else if(boost::algorithm::starts_with(*p, "-o"))
			{
				outputFile = (*p).substr(2);
			}
			else if(*p == "-elf2mac")
			{
				elf2mac = true;
			}
			else if(*p == "--mac-flat")
			{
				elf2mac = true;
				flatoutput = true;
			}
			else if(*p == "--mac-segments")
			{
				elf2mac = true;
				if(flatoutput)
					errx(EXIT_FAILURE, "--mac-segments can't be used with --mac-flat");
				++p;
				if(p == e)
					errx(EXIT_FAILURE, "--mac-segments missing argument");
				//segmentMapFile = *p;
			}
			else
			{
				args2.push_back(*p);
			}
		}

		if(elf2mac)
		{
			char tmpfile[] = "/tmp/ldscriptXXXXXX";
			int fd = mkstemp(tmpfile);
			if(fd < 0)
				errx(EXIT_FAILURE, "can't create temp file");

			{
				ofstream out(tmpfile);
				CreateLdScript(out, segments);
				CreateLdScript(std::cout, segments);
			}

			args2.push_back("-o");
			args2.push_back(outputFile + ".gdb");
			args2.push_back("-T");
			args2.push_back(tmpfile);
			RealLD(args2);
			unlink(tmpfile);
			GrokELF(outputFile + ".gdb");
			if(flatoutput)
				FlatCode(outputFile);
			else if(segments)
				MultiSegmentApp(outputFile);
			else
				SingleSegmentApp(outputFile);
		}
		else
		{
			RealLD(args);
		}
		return 0;
	}
	else
	{
		if(argc != 2)
			errx(EXIT_FAILURE, "usage : %s file-name ", argv[0]);
		GrokELF(argv[1]);
		MultiSegmentApp("out.bin");
	}
	return 0;
}



