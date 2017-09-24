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
#include <vector>
#include <fstream>
#include <iostream>
#include <sstream>
#include <memory>

#include <boost/algorithm/string/predicate.hpp>

using std::string;
using std::unordered_map;
using std::vector;
using std::ofstream;
using std::shared_ptr;
using std::make_shared;
using std::unique_ptr;

size_t sectionHeaderStringTableIdx;
size_t mainStringTableIdx = (size_t)-1;

class Symtab;
class Section;

std::vector<int> relocs;
unique_ptr<Symtab> symtab;
unordered_map<string, shared_ptr<Section>> sections;
unordered_map<int, shared_ptr<Section>> sectionsByElfIndex;

std::vector<shared_ptr<Section>> codeSections;
shared_ptr<Section> dataSection;

enum class SectionKind
{
	undefined = -1,
	code = 0,
	data,
	bss,
	jumptable
};

class Symbol : public GElf_Sym
{
public:
	bool valid;
	bool referencedExternally;
	SectionKind sectionKind;

	Symbol();
	Symbol(GElf_Sym sym);
};

class Symtab
{
public:
	Elf_Scn *elfsec;
	Elf_Data *data;
	vector<Symbol> symbols;

	Symtab(Elf_Scn *elfsec);

	Symbol& GetSym(int idx);
};

class Section
{
public:
	string name;
	int idx;
	SectionKind kind;
	Elf_Scn *elfsec, *relasec;
	Elf_Data *data;

	std::vector<GElf_Rela> relocs;

	Section(string name, int idx, SectionKind kind, Elf_Scn *elfsec);
	void SetRela(Elf_Scn *scn);

	uint32_t GetSize();
	string GetData();
	string GetAbsRelocations(bool suppressTerminatingEntry = false);

	void ScanRelocs();
};

Symbol::Symbol()
    : valid(false)
{
}

Symbol::Symbol(GElf_Sym sym)
    : GElf_Sym(sym), valid(true),
      referencedExternally(false),
      sectionKind(SectionKind::undefined)
{
	if(st_shndx != SHN_UNDEF)
	{
		sectionKind = sectionsByElfIndex[st_shndx]->kind;
	}
}

Symtab::Symtab(Elf_Scn *elfsec)
    : elfsec(elfsec)
{
	data = elf_getdata(elfsec, NULL);

	GElf_Shdr shdr;
	gelf_getshdr(elfsec, &shdr);

	int count = shdr.sh_size / shdr.sh_entsize;
	symbols.resize(count);
}

Symbol &Symtab::GetSym(int idx)
{
	if(symbols[idx].valid)
		return symbols[idx];
	else
	{
		GElf_Sym sym;
		auto res = gelf_getsym(data, idx, &sym);
		assert(res != 0);

		return (symbols[idx] = Symbol(sym));
	}
}

Section::Section(string name, int idx, SectionKind kind, Elf_Scn *elfsec)
    : name(name), idx(idx), kind(kind), elfsec(elfsec), relasec(NULL)
{
	data = elf_getdata(elfsec, NULL);
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

string Section::GetAbsRelocations(bool suppressTerminatingEntry)
{
	if(!relasec)
		return "";
	std::ostringstream out;

	for(auto& rela : relocs)
	{
		//printf("rel: %d %d %x %x\n", (int)GELF_R_TYPE(rela.r_info), (int)GELF_R_SYM(rela.r_info), (unsigned)rela.r_addend, (unsigned)rela.r_offset);

		int symidx = GELF_R_SYM(rela.r_info);
		if(symidx == 0)
			continue;

		Symbol& sym = symtab->GetSym(symidx);

		if(sym.st_shndx == SHN_UNDEF)
			continue;

		if(GELF_R_TYPE(rela.r_info) == R_68K_32)
		{
			assert(sym.sectionKind != SectionKind::undefined);

			longword(out, rela.r_offset | ((int)sym.sectionKind << 24));
		}
	}
	if(!suppressTerminatingEntry)
		longword(out, -1);
	return out.str();
}

void Section::ScanRelocs()
{
	for(auto& rela : relocs)
	{
		int symidx = GELF_R_SYM(rela.r_info);
		if(symidx == 0)
			continue;

		Symbol& sym = symtab->GetSym(symidx);

		if(sym.st_shndx == SHN_UNDEF)
			continue;

		if(sym.st_shndx != idx)
			sym.referencedExternally = true;
	}
}


void GrokELF(string input)
{
	if(elf_version ( EV_CURRENT ) == EV_NONE)
		errx(EXIT_FAILURE , "ELF library initialization failed: %s", elf_errmsg( -1));

	int fd = open(input.c_str(), O_RDONLY, 0);
	Elf *elf = elf_begin(fd, ELF_C_READ, NULL);

	elf_getshdrstrndx(elf, &sectionHeaderStringTableIdx);

	GElf_Ehdr ehdr;
	gelf_getehdr(elf, &ehdr);

	Elf_Scn* bssSection = NULL;

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
			bssSection = scn;
			// Currently, the bss section is used
			// to know when to start skipping debug info sections.
			// (What's the official way to distinguish a debug info section from a "real" section?)

			sections[name] = sectionsByElfIndex[idx] =
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
		out << sec->GetAbsRelocations(true);
	out << dataSection->GetAbsRelocations();

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

	for(auto sec : codeSections)
	{
		sec->ScanRelocs();
	}

	rsrc.addResource(Resource(ResType("CODE"), 0,
	    fromhex(
	        "00000028 00000000 00000008 00000020"
	        "0000 3F3C 0001 A9F0"
	    )
	));


	int id = 1;
	for(auto sec : codeSections)
	{
		std::ostringstream code;
		word(code, 0);				//FIXME: header
		word(code, 1);
		code << sec->GetData();

		rsrc.addResource(Resource(ResType("CODE"), id,
		                          code.str()));


		rsrc.addResource(Resource(ResType("RELA"),id, sec->GetAbsRelocations()));
		id++;
	}

	rsrc.addResource(Resource(ResType("DATA"),0, dataSection->GetData()));




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
		bool segments = false;

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
		FlatCode("out.flt");
	}
	return 0;
}


