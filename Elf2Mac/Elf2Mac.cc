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

unordered_map<string, Elf_Scn*> codeSections;
unordered_map<string, Elf_Scn*> relaSections;
Elf_Scn* dataSection;
Elf_Scn* bssSection;
Elf_Scn *symtabSection;
size_t sectionHeaderStringTableIdx;
size_t mainStringTableIdx;

class Symtab;

std::vector<int> relocs;
unique_ptr<Symtab> symtab;

class Symtab
{
public:
	Elf_Scn *elfsec;
	Elf_Data *data;

	Symtab(Elf_Scn *elfsec);

	GElf_Sym GetSym(int idx);
};

Symtab::Symtab(Elf_Scn *elfsec)
    : elfsec(elfsec)
{
	data = elf_getdata(elfsec, NULL);
}

GElf_Sym Symtab::GetSym(int idx)
{
	GElf_Sym sym;
	auto res = gelf_getsym(data, idx, &sym);
	assert(res != 0);
	return sym;
}

class Section
{
public:
	Elf_Scn *elfsec, *relasec;
	Elf_Data *data;

	Section(int idx, Elf_Scn *elfsec);
	void SetRela(Elf_Scn *scn);

	uint32_t GetSize();
	string GetData();
	string GetAbsRelocations();
};

Section::Section(int idx, Elf_Scn *elfsec)
    : elfsec(elfsec), relasec(NULL)
{
	data = elf_getdata(elfsec, NULL);
}

void Section::SetRela(Elf_Scn *scn)
{
	relasec = scn;
}

uint32_t Section::GetSize()
{
	return data->d_size;
}

string Section::GetData()
{
	return string((char*)data->d_buf, (char*)data->d_buf + data->d_size);
}

string Section::GetAbsRelocations()
{
	if(!relasec)
		return "";
	std::ostringstream out;


	std::vector<int> relocs;

	GElf_Shdr shdr;
	gelf_getshdr(relasec, &shdr);

	int nRela = shdr.sh_size / shdr.sh_entsize;
	Elf_Data *data = elf_getdata(relasec, NULL);
	for(int i = 0; i < nRela; i++)
	{
		GElf_Rela rela;
		gelf_getrela(data, i, &rela);

		//printf("rel: %d %d %x %x\n", (int)GELF_R_TYPE(rela.r_info), (int)GELF_R_SYM(rela.r_info), (unsigned)rela.r_addend, (unsigned)rela.r_offset);

		int symidx = GELF_R_SYM(rela.r_info);
		if(symidx == 0)
			continue;

		GElf_Sym sym = symtab->GetSym(symidx);

		if(sym.st_shndx == SHN_UNDEF)
			continue;

		if(GELF_R_TYPE(rela.r_info) == R_68K_32)
			relocs.push_back(rela.r_offset);
	}
	std::sort(relocs.begin(), relocs.end());
	for(int reloc : relocs)
		longword(out, reloc);
	return out.str();
}

unordered_map<string, shared_ptr<Section>> sections;

void GrokELF(string input)
{
	if(elf_version ( EV_CURRENT ) == EV_NONE)
		errx(EXIT_FAILURE , "ELF library initialization failed: %s", elf_errmsg( -1));

	int fd = open(input.c_str(), O_RDONLY, 0);
	Elf *elf = elf_begin(fd, ELF_C_READ, NULL);

	elf_getshdrstrndx(elf, &sectionHeaderStringTableIdx);

	GElf_Ehdr ehdr;
	gelf_getehdr(elf, &ehdr);

	unordered_map<string, Elf_Scn*> progbits;

	int idx = 0;
	for(Elf_Scn *scn = NULL; (scn = elf_nextscn(elf, scn)) != NULL;idx++)
	{
		GElf_Shdr shdr;
		gelf_getshdr(scn, &shdr);
		std::string name = elf_strptr(elf, sectionHeaderStringTableIdx, shdr.sh_name);
		//printf("section: %s\n", name.c_str());

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
				relaSections[progbitsName] = scn;
				assert(sections.find(progbitsName) != sections.end());
				sections[progbitsName]->SetRela(scn);
			}
		}
		if(shdr.sh_type == SHT_PROGBITS
		        && !bssSection)	// ignore everything after bss, that's just debug info
		{
			codeSections[name] = scn;
			sections.emplace(name, make_shared<Section>(idx, scn));
		}
		if(shdr.sh_type == SHT_NOBITS)
		{
			bssSection = scn;
		}
	}
}

void ElfToFlt(string input, string output)
{
	GrokELF(input);

	GElf_Shdr text_shdr, data_shdr, bss_shdr;
	gelf_getshdr(codeSections[".text"], &text_shdr);
	gelf_getshdr(codeSections[".data"], &data_shdr);
	gelf_getshdr(bssSection, &bss_shdr);

	ofstream out(output);

	out << sections[".text"]->GetData();
	out << sections[".data"]->GetData();

	out << sections[".text"]->GetAbsRelocations();
	out << sections[".data"]->GetAbsRelocations();
	longword(out, -1);
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
				CreateLdScript(out);
			}
			args2.push_back("-o");
			args2.push_back(outputFile + ".gdb");
			args2.push_back("-T");
			args2.push_back(tmpfile);
			RealLD(args2);
			unlink(tmpfile);
			ElfToFlt(outputFile + ".gdb", outputFile);
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
		ElfToFlt(argv[1], "out.flt");
	}
	return 0;
}


