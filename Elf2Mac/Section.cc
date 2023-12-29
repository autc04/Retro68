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

#include "Section.h"

#include "Symbol.h"
#include "Reloc.h"
#include "Object.h"
#include "Symtab.h"

#include <algorithm>
#include <sstream>
#include <assert.h>
#include <iostream>

#include "BinaryIO.h"

using std::string;

Section::~Section()
{
}

Section::Section(Object& theObject, string name, int idx, SectionKind kind, Elf_Scn *elfsec)
    : theObject(theObject),
      name(name), idx(idx), kind(kind), elfsec(elfsec), relasec(NULL),
      exceptionInfoStart(0),
      codeID(-1), firstJTEntryIndex(0)
{
    data = elf_getdata(elfsec, NULL);
    gelf_getshdr(elfsec, &shdr);
    outputBase = shdr.sh_addr;
}


void Section::SetRela(Elf_Scn *scn)
{
    relasec = scn;
    GElf_Shdr rshdr;
    gelf_getshdr(relasec, &rshdr);

    int nRela = rshdr.sh_size / rshdr.sh_entsize;
    Elf_Data *data = elf_getdata(relasec, NULL);
    for(int i = 0; i < nRela; i++)
    {
        GElf_Rela rela;
        gelf_getrela(data, i, &rela);

        if(rela.r_offset < shdr.sh_addr || rela.r_offset > shdr.sh_addr + shdr.sh_size - 4)
        {
            // FIXME: There are sometimes relocations beyond the end of the sections
            //        in LD output for some reason. That's bad. Let's ignore it.
            continue;
        }
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

std::vector<RuntimeReloc> Section::GetRelocations(bool useOffsets)
{
    std::vector<RuntimeReloc> outRelocs;

    for(auto& rela : relocs)
    {
        //printf("rel: %d %d %x %x\n", (int)GELF_R_TYPE(rela.r_info), (int)GELF_R_SYM(rela.r_info), (unsigned)rela.r_addend, (unsigned)rela.r_offset);

        int symidx = GELF_R_SYM(rela.r_info);
        if(symidx == 0)
            continue;

        Symbol& sym = theObject.symtab->GetSym(symidx);

        if(sym.st_shndx == SHN_UNDEF || sym.st_shndx >= SHN_LORESERVE)
            continue;
        if(sym.sectionKind == SectionKind::undefined)
            continue;

        uint32_t offset = rela.r_offset;
        if(useOffsets)
            offset -= shdr.sh_addr;

        if(GELF_R_TYPE(rela.r_info) == R_68K_32)
        {
            outRelocs.emplace_back(rela.relocBase, offset);
        }

        if(GELF_R_TYPE(rela.r_info) == R_68K_PC32
            && sym.st_shndx != idx)
        {
            outRelocs.emplace_back(rela.relocBase, offset, true);
        }
    }

    return outRelocs;
}

void Section::ScanRelocs()
{
    for(Reloc& rela : relocs)
    {
        int symidx = GELF_R_SYM(rela.r_info);
        if(symidx == 0)
            continue;

        Symbol *sym = &theObject.symtab->GetSym(symidx);

        if(sym->st_shndx == SHN_UNDEF)
            continue;

        if(rela.r_addend != 0)
        {
            int symidx2 = theObject.symtab->FindSym(sym->st_shndx, sym->st_value + rela.r_addend);
            if(symidx2 != -1)
            {
                sym = &theObject.symtab->GetSym(symidx2);
                rela.r_addend = 0;
                rela.r_info = GELF_R_INFO(symidx2, GELF_R_TYPE(rela.r_info));

            }
        }

        if(sym->st_shndx != idx)
            sym->referencedExternally = true;
    }
}

void Section::FixRelocs(bool allowDirectCodeRefs)
{
    for(Reloc& rela : relocs)
    {
        if(GELF_R_TYPE(rela.r_info) != R_68K_32 && GELF_R_TYPE(rela.r_info) != R_68K_PC32)
            continue;

        int symidx = GELF_R_SYM(rela.r_info);
        if(symidx == 0)
            continue;
        Symbol& sym = theObject.symtab->GetSym(symidx);

        if(sym.sectionKind == SectionKind::undefined)
            continue;

        if(GELF_R_TYPE(rela.r_info) == R_68K_PC32 && sym.st_shndx == idx)
            continue;

        RelocBase relocBase;
        switch(sym.sectionKind)
        {
            case SectionKind::code:
                relocBase = RelocBase::code;
                if(exceptionInfoStart != 0 && rela.r_offset >= exceptionInfoStart
                    && sym.name != "__gxx_personality_v0")
                {
                    // Case 1:
                    //  references from .eh_frame, with the exception of __gcc_personality_v0.
                    //  Should be direct references within the code segment.

                    if(sym.section.get() != this)
                    {
#if 0                        
                        std::cerr << "Warning: clearing cross-segment reference from .eh_frame:\n"
                                  << sym.name << " (" << name << "->" << sym.section->name << ")\n";
                        std::cerr << std::hex << (int)sym.st_info << " " << (int)sym.st_other << std::endl;
                        //assert(GELF_ST_BIND(sym.st_info) == STB_WEAK);
#endif

                        /*
                            ld behaves differently depending on whether debug info is present.
                            If debug info is present, .eh_frame sections will contain references
                            to other code segments, if no debug info is generated (or it is 
                            stripped at link time), then these pointers are set to 0 during linking.

                            In most cases, this has to do with weak symbols; the instance of the
                            symbol that is removed gets a null ptr (with R_68K_NONE relocation) in
                            the .eh_frame section if there is no debug info, but gets remapped to
                            the surviving instance if there is debug info.
                            It also happens with some section symbols, and I *hope* this is related.

                            This makes no sense to me, but the reason is probably buried somewhere
                            within a 900-line function of C code within a 15000 line source file
                            in GNU bfd.

                            I *hope* that the correct behavior is to just clear those pointers.
                        */
                        uint8_t *relocand = ((uint8_t*) data->d_buf + rela.r_offset - shdr.sh_addr);

                        relocand[0] = relocand[1] = relocand[2] = relocand[3] = 0;
                        rela.r_info = 0;
                    }
                }
                else if(sym.needsJT)
                {
                    // Case 2: References to code that can go through the jump table.
                    //  If we need an addend, that's a problem and we abort.

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
                                      << "(" << sym.name << ")"
                                      << "+" << rela.r_offset << std::endl;
                        }
                        assert(sym.section.get() == this);
                    }
                }
                else if(allowDirectCodeRefs)
                {
                    // Case 3: Direct Code Refs are allowed (single-segment exectuable),
                    //  We are happy. Nothing to check or do.
                }
                else
                {
                    // Case 4: Multi-segment executable.
                    //  Code references that don't go through the jump table
                    //  must remain in the current segment.
                    
                    if(sym.section.get() != this)
                    {
                        //  Should never happen because symbols that are referenced from a different
                        //  segment get their needsJT flag set (ScanRelocs and Obejct::MultiSegmentApp).
                        std::cerr << "Invalid ref from "
                                  << name << ":" << std::hex << rela.r_offset-shdr.sh_addr << std::dec
                                  << " to " << sym.section->name
                                  << "(" << sym.name << ")"
                                  << "+" << rela.r_offset << std::endl;
                        std::cerr << "needsJT: " << (sym.needsJT ? "true" : "false") << std::endl;
                        std::cerr << "from addr: " << rela.r_offset << ", exceptionInfoStart: " << exceptionInfoStart << std::endl;

                    }
                    assert(sym.section.get() == this);
                }
                break;
            case SectionKind::data:
                relocBase = RelocBase::data;
                break;
            case SectionKind::bss:
                relocBase = RelocBase::bss;
                break;
            case SectionKind::undefined:
                assert(false);
                break;
        }

        if(!GELF_R_SYM(rela.r_info))
            continue;   // symboil reference has been cleared in Case 1 above

        rela.relocBase = relocBase;

        uint8_t *relocand = ((uint8_t*) data->d_buf + rela.r_offset - shdr.sh_addr);

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
