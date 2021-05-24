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

#ifndef RELOC_H
#define RELOC_H

#include <gelf.h>
#include <stdint.h>

#include <string>
#include <vector>

enum class RelocBase
{
    code = 0,
    data,
    bss,
    jumptable
};

class Reloc : public GElf_Rela
{
public:
    RelocBase relocBase;

    Reloc();
    Reloc(const GElf_Rela& rela);
};

class RuntimeReloc
{
public:
    RelocBase base = RelocBase::code;
    uint32_t offset = 0;
    bool relative = false;

    RuntimeReloc(RelocBase b = RelocBase::code, uint32_t o = 0, bool r = false) : base(b), offset(o), relative(r) {}
};

std::string SerializeRelocsUncompressed(std::vector<RuntimeReloc> relocs);
std::string SerializeRelocs(std::vector<RuntimeReloc> relocs);

#endif // RELOC_H
