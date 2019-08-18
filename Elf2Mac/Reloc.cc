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

#include "Reloc.h"
#include <sstream>
#include "BinaryIO.h"

Reloc::Reloc()
{
}

Reloc::Reloc(const GElf_Rela &rela)
    : GElf_Rela(rela), relocBase(RelocBase::code)
{
}

std::string SerializeRelocsUncompressed(std::vector<RuntimeReloc> relocs)
{
    std::ostringstream out;
    for(const auto& r : relocs)
    {
        longword(out, r.offset | ((int)r.base << 24));
    }
    longword(out, -1);
    return out.str();
}

std::string SerializeRelocs(std::vector<RuntimeReloc> relocs)
{
    std::ostringstream out;
    uint32_t offset = -1;

    for(const auto& r : relocs)
    {
        uint32_t delta = r.offset - offset;
        offset = r.offset;

        uint32_t base = (uint32_t) r.base;

        uint32_t encoded = (delta << 2) | base;

        while(encoded >= 128)
        {
            byte(out, (encoded & 0x7F) | 0x80);
            encoded >>= 7;
        }
        byte(out, encoded);
    }

    byte(out, 0);

    return out.str();
}
