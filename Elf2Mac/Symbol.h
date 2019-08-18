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

#ifndef SYMBOL_H
#define SYMBOL_H

#include <gelf.h>

#include <memory>
#include <string>

enum class SectionKind;
class Section;
class Object;

class Symbol : public GElf_Sym
{
public:
    bool valid;
    bool referencedExternally;
    SectionKind sectionKind;
    bool needsJT;
    int jtIndex;
    std::shared_ptr<Section> section;
    std::string name;

    Symbol();
    Symbol(Object &theObject, const GElf_Sym& sym);
};


#endif // SYMBOL_H
