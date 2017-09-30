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

#ifndef SECTION_H
#define SECTION_H

#include <gelf.h>

#include <stdint.h>
#include <string>
#include <vector>

class Object;
class Reloc;
class Symbol;
class RuntimeReloc;

enum class SectionKind
{
	undefined = -1,
	code = 0,
	data,
	bss
};

class Section
{
public:
	Object& theObject;
	std::string name;
	int idx;
	SectionKind kind;
	Elf_Scn *elfsec, *relasec;
	Elf_Data *data;
	GElf_Shdr shdr;
	uint32_t outputBase;
	uint32_t exceptionInfoStart;

	int codeID;

	std::vector<Reloc> relocs;
	std::vector<Symbol*> jtEntries;
	int firstJTEntryIndex;

	Section(Object& object, std::string name, int idx, SectionKind kind, Elf_Scn *elfsec);
	~Section();
	void SetRela(Elf_Scn *scn);

	uint32_t GetSize();
	std::string GetData();
	std::vector<RuntimeReloc> GetRelocations(bool useOffsets);

	void ScanRelocs();
	void FixRelocs();

};


#endif // SECTION_H
