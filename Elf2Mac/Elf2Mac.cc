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

#include <boost/algorithm/string/predicate.hpp>

using std::string;
using std::unordered_map;
using std::vector;
using std::ofstream;

unordered_map<string, Elf_Scn*> codeSections;
unordered_map<string, Elf_Scn*> relaSections;
Elf_Scn* dataSection;
Elf_Scn* bssSection;
Elf_Scn *symtabSection;

void ElfToFlt(string input, string output)
{
	std::cout << "************ ELF2FLT\n";
	if(elf_version ( EV_CURRENT ) == EV_NONE)
		errx(EXIT_FAILURE , "ELF library initialization failed: %s", elf_errmsg( -1));

	int fd = open(input.c_str(), O_RDONLY, 0);
	Elf *e = elf_begin(fd, ELF_C_READ, NULL);

	size_t shstrndx;
	elf_getshdrstrndx(e, &shstrndx);

	GElf_Ehdr ehdr;
	gelf_getehdr(e, &ehdr);

	Elf_Scn *symtab = NULL;
	int nSyms;

	for(Elf_Scn *scn = NULL; (scn = elf_nextscn(e, scn)) != NULL;)
	{
		GElf_Shdr shdr;
		gelf_getshdr(scn, &shdr);
		if(shdr.sh_type == SHT_SYMTAB)
		{
			symtab = scn;
			nSyms = shdr.sh_size / shdr.sh_entsize;
			break;
		}
	}
	Elf_Data *symtabData = elf_getdata(symtab, NULL);

	std::vector<int> relocs;

	for(Elf_Scn *scn = NULL; (scn = elf_nextscn(e, scn)) != NULL;)
	{
		GElf_Shdr shdr;
		gelf_getshdr(scn, &shdr);
		std::string name = elf_strptr(e, shstrndx, shdr.sh_name);
		printf("section: %s\n", name.c_str());

		if(shdr.sh_type == SHT_RELA
		        && !bssSection)	// ignore everything after bss, that's just debug info
		{
			printf("(rela)\n");

			int nRela = shdr.sh_size / shdr.sh_entsize;
			Elf_Data *data = elf_getdata(scn, NULL);
			for(int i = 0; i < nRela; i++)
			{
				GElf_Rela rela;
				gelf_getrela(data, i, &rela);

				GElf_Sym sym;
				if(gelf_getsym(symtabData, GELF_R_SYM(rela.r_info),&sym) != 0)
				{
					if(sym.st_shndx == SHN_UNDEF)
						continue;
				}

				if(GELF_R_TYPE(rela.r_info) == R_68K_32)
					relocs.push_back(rela.r_offset);
				//printf("rel: %d %d %x %x\n", (int)GELF_R_TYPE(rela.r_info), (int)GELF_R_SYM(rela.r_info), (unsigned)rela.r_addend, (unsigned)rela.r_offset);
			}

			if(boost::algorithm::starts_with(name,".rela."))
			{
				relaSections[name.substr(5)] = scn;
			}
		}
		if(shdr.sh_type == SHT_PROGBITS
		        && !bssSection)	// ignore everything after bss, that's just debug info
		{
			codeSections[name] = scn;
			printf("(progbits)\n");
		}
		if(shdr.sh_type == SHT_NOBITS)
		{
			bssSection = scn;
			printf("(nobits)\n");
		}
	}

	/*for(int i = 0; i < nSyms; i++)
	{
		GElf_Sym sym;
		if(gelf_getsym(symtabData, i, &sym) == 0)
			printf("computer says no.\n");
		printf("%s at %x\n", elf_strptr(e, shstrndx-1, sym.st_name), (unsigned) sym.st_value);
	}*/

	std::sort(relocs.begin(), relocs.end());

	ofstream out(output);

	byte(out, 'b');
	byte(out, 'F');
	byte(out, 'L');
	byte(out, 'T');
	longword(out, 4);
	longword(out, 0x40 + ehdr.e_entry);	// entry point

	GElf_Shdr text_shdr, data_shdr, bss_shdr;
	gelf_getshdr(codeSections[".text"], &text_shdr);
	gelf_getshdr(codeSections[".data"], &data_shdr);
	gelf_getshdr(bssSection, &bss_shdr);

	longword(out, 0x40 + data_shdr.sh_addr); // data start
	longword(out, 0x40 + bss_shdr.sh_addr);	// data end
	longword(out, 0x40 + bss_shdr.sh_addr + bss_shdr.sh_size);	// bss end
	longword(out, 4096); // stack size, ignored
	longword(out, 0x40 + bss_shdr.sh_addr); // relocStart);
	longword(out, relocs.size());
	longword(out, 0); // flags
	for(int i = 0; i < 6; i++)
		longword(out, 0); // filler

	Elf_Data *data = elf_getdata(codeSections[".text"], NULL);
	out << string((char*)data->d_buf, (char*)data->d_buf + data->d_size);

	while(out.tellp() < 0x40 + data_shdr.sh_addr)
		byte(out, 0x00);
	data = elf_getdata(codeSections[".data"], NULL);
	out << string((char*)data->d_buf, (char*)data->d_buf + data->d_size);

	while(out.tellp() < 0x40 + bss_shdr.sh_addr)
		byte(out, 0x00);
	for(int reloc : relocs)
		longword(out, reloc);
	longword(out, -1);	// not part of the FLT specification: terminate reloc list
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
		bool elf2flt = false;
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
			else if(*p == "-elf2flt")
			{
				elf2flt = true;
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
			errx(EXIT_FAILURE, "-elf2mac: not yet implemented");
		}
		else if(elf2flt)
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
