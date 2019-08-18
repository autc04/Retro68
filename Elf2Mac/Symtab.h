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

#ifndef SYMTAB_H
#define SYMTAB_H

#include <gelf.h>

#include <vector>
#include <map>
#include <unordered_map>
#include <string>

class Object;
class Symbol;

class Symtab
{
public:
    Elf_Scn *elfsec;
    Elf_Data *data;
    std::vector<Symbol> symbols;
    std::map<std::pair<int,uint32_t>, int> symbolsByAddress;
    std::unordered_map<std::string, int> symbolsByName;

    Symtab(Object &theObject, Elf_Scn *elfsec);
    ~Symtab();

    Symbol& GetSym(int idx);
    int FindSym(int secidx, uint32_t addr);
    int FindSym(std::string name);
};


#endif // SYMTAB_H
