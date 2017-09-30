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

#include "Symtab.h"

#include <assert.h>
#include <utility>

#include "Symbol.h"

using std::make_pair;
using std::string;

Symtab::Symtab(Object& theObject, Elf_Scn *elfsec)
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
		symbols.emplace_back(theObject, sym);

		if(sym.st_shndx != SHN_UNDEF && sym.st_shndx < SHN_LORESERVE)
			symbolsByAddress[make_pair((int)sym.st_shndx,sym.st_value)] = i;
		if(sym.st_name)
			symbolsByName[symbols.back().name] = i;
	}
}

Symtab::~Symtab()
{

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

int Symtab::FindSym(string name)
{
	auto p = symbolsByName.find(name);
	if(p != symbolsByName.end())
		return p->second;
	else
		return -1;
}
