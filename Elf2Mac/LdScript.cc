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
#include "SegmentMap.h"

#include <iostream>
#include <boost/algorithm/string/replace.hpp>
#include <boost/lexical_cast.hpp>
#include <string>

using std::string;

const char * scriptStart = R"ld(/* ld script for Elf2Mac */
ENTRY( @entryPoint@ )
PHDRS
{
    text PT_LOAD;
    bss PT_LOAD;
}
SECTIONS
{
)ld";

const char * textSection = R"ld(/* ld script for Elf2Mac */
    .text :    {
        _stext = . ;
        PROVIDE(_rsrc_start = .);
        *(.rsrcheader)
        . = ALIGN (2);

        /* The entry point. */
        _entry_trampoline = .;
        SHORT(DEFINED(__break_on_entry) ? 0xA9FF : 0x4e71);
        LONG(0x61000002); /* bsr *+2 */
        SHORT(0x0697); /* addi.l #_, (a7) */
        LONG(@entryPoint@ - _entry_trampoline - 6);

        PROVIDE(_start = .); /* fallback entry point to a safe spot - needed for libretro bootstrap */
        Retro68InitMultisegApp = .; /* override this for the single-segment case */
        SHORT(0x4e75); /* rts */

        *(.relocvars)
        */libretrocrt.a:start.c.obj(.text*)
        */libretrocrt.a:relocate.c.obj(.text*)
        */libretrocrt.a:*(.text*)
        */libInterface.a:*(.text*)
        *(.text*)

        *(.stub)
        *(.gnu.linkonce.t*)
        *(.glue_7t)
        *(.glue_7)
        *(.jcr)
        . = ALIGN (4) ;
        __init_section = . ;
        KEEP (*(.init))
        __init_section_end = . ;
        __fini_section = . ;
        KEEP (*(.fini))
        __fini_section_end = . ;

        __EH_FRAME_BEGIN__ = .;
        KEEP(*(.eh_frame))
        LONG(0);

        KEEP(*(.gcc_except_table))
        KEEP(*(.gcc_except_table.*))

        /* NOTE: Elf2Mac expects the sections to be contiguous,
                 so include the alignment before the end of this section.
        */
        . = ALIGN(0x4) ;
        _etext = . ;
    } : text
)ld";

const char * scriptEnd = R"ld(
    .data : {
        _sdata = . ;
        *(.got.plt)
        *(.got)
        FILL(0) ;
        . = ALIGN(0x20) ;
        LONG(-1)
        . = ALIGN(0x20) ;
        *(.rodata)
        *(.rodata1)
        *(.rodata.*)
        *(.gnu.linkonce.r*)
        *(.data)
        *(.data1)
        *(.data.*)
        *(.gnu.linkonce.d*)

        . = ALIGN(4) ;
        __CTOR_LIST__ = .;
        KEEP (*(.ctors))
        KEEP (*(SORT(.ctors.*)))
        __CTOR_END__ = .;
        LONG(0);

        . = ALIGN(0x4);
        __DTOR_LIST__ = .;
        KEEP (*(.dtors))
        KEEP (*(SORT(.dtors.*)))
        __DTOR_END__ = .;
        LONG(0);

        . = ALIGN(0x4);
        _edata = . ;
    } : @data_segment@
    .bss ALIGN(0x4) : {
        _sbss = .;
        *(.dynsbss)
        *(.sbss)
        *(.sbss.*)
        *(.scommon)
        *(.dynbss)
        *(.bss)
        *(.bss.*)
        *(.bss*)
        *(.gnu.linkonce.b*)
        *(COMMON)
        . = ALIGN(0x10) ;
        _ebss = . ;
    } : @bss_segment@
    /* DWARF debug sections.
        Symbols in the DWARF debugging sections are relative to the beginning
        of the section so we begin them at 0.  */
    /* DWARF 1 */
    .debug          0 : { *(.debug) }
    .line           0 : { *(.line) }
    /* GNU DWARF 1 extensions */
    .debug_srcinfo  0 : { *(.debug_srcinfo) }
    .debug_sfnames  0 : { *(.debug_sfnames) }
    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    /* DWARF 2 */
    .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line .debug_line.* .debug_line_end) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }
    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames 0 : { *(.debug_weaknames) }
    .debug_funcnames 0 : { *(.debug_funcnames) }
    .debug_typenames 0 : { *(.debug_typenames) }
    .debug_varnames  0 : { *(.debug_varnames) }
    /* DWARF 3 */
    .debug_pubtypes 0 : { *(.debug_pubtypes) }
    .debug_ranges   0 : { *(.debug_ranges) }
    /* DWARF Extension.  */
    .debug_macro    0 : { *(.debug_macro) }
    .debug_addr     0 : { *(.debug_addr) }    
}
)ld";

void CreateFlatLdScript(std::ostream& out, string entryPoint, bool stripMacsbug)
{
    out << "_MULTISEG_APP = 0;\n";
    out << boost::replace_all_copy<string>(scriptStart, "@entryPoint@", entryPoint);
    if(stripMacsbug)
    {
        out << "\t.strippedmacsbugnames 0 (NOLOAD) : { *(.text.*.macsbug) }\n";
        out << "\t. = 0;\n";
    }
    out << boost::replace_all_copy<string>(textSection, "@entryPoint@", entryPoint) << 
        boost::replace_all_copy<string>(boost::replace_all_copy<string>(scriptEnd, "@data_segment@", "text"), "@bss_segment@", "bss");
}


void SegmentInfo::WriteFilters(std::ostream &out, string section)
{
    for(string filter : filters)
    {
        out << "        " << filter << "(" << section << ")\n";
        out << "        " << filter << "(" << section << ".*)\n";
    }
}
void SegmentInfo::WriteFiltersKeep(std::ostream &out, string section)
{
    for(string filter : filters)
    {
        out << "\t\tKEEP(" << filter << "(" << section << "))\n";
        out << "\t\tKEEP(" << filter << "(" << section << ".*))\n";
    }
}

void SegmentInfo::CreateLdScript(std::ostream &out, string entryPoint)
{
    out << "\t.code" << id << " : {\n";
    out << "\t\tFILL(0x4E71);\n";
    if(id == 1)
    {
        out << boost::replace_all_copy<string>(R"ld(
        _stext = .;
        FILL(0x4E71);
        PROVIDE(_rsrc_start = .);
        . = ALIGN (2);
        _entry_trampoline = .;
        SHORT(DEFINED(__break_on_entry) ? 0xA9FF : 0x4e71);
        LONG(0x61000002);    /* bsr *+2 */
        SHORT(0x0697); /* addi.l #_, (a7) */
        LONG(@entryPoint@ - _entry_trampoline - 6);
        PROVIDE(_start = .);  /* fallback entry point to a safe spot - needed for libretro bootstrap */
        SHORT(0x4e75); /* rts */

        FILL(0);
        *(.relocvars)
        FILL(0x4E71);
)ld", "@entryPoint@", entryPoint);
    }
    WriteFilters(out, ".text");

    if(id == 2)
    {
        out << "\t\t*(.gnu.linkonce.t*)\n";
    }
    if(id == 1)
    {
        out << R"ld(
        . = ALIGN (4) ;
        __init_section = .;
        KEEP (*(.init))
        __init_section_end = .;
        __fini_section = .;
        KEEP (*(.fini))
        __fini_section_end = .;
)ld";
    }

    out << "\t\t. = ALIGN (4);\n";    // this is important, for some reason.
    if(id == 1)
        out << "\t\t__EH_FRAME_BEGIN__" << " = .;\n";
    else
        out << "\t\t__EH_FRAME_BEGIN__" << id << " = .;\n";
    WriteFiltersKeep(out, ".eh_frame");
    out << "\t\tLONG(0);\n";
    WriteFiltersKeep(out, ".gcc_except_table");

    if(id == 1)
    {
        out << R"ld(
        . = ALIGN(0x4) ;
        _etext = . ;
)ld";
    }
    else
    {
        out << boost::replace_all_copy<string>(R"ld(
        . = ALIGN(0x4);
        FILL(0);
        . += 32;
        LONG(__EH_FRAME_BEGIN__@N@ - .);
)ld", "@N@", boost::lexical_cast<string>(id));
    }

    out << "\t} : code" << id << "\n";

}

void SegmentMap::CreateLdScript(std::ostream &out, string entryPoint, bool stripMacsbug)
{
    int maxId = std::max_element(segments.begin(), segments.end(), [](const auto& a, const auto& b) { return a.id < b.id; })->id;

    out << "/* ld script for Elf2Mac */\n";
    out << "_MULTISEG_APP = 1;\n";
    out << "ENTRY( " << entryPoint << " )\n";
    out << "PHDRS\n{\n";
    for(int id = 1; id <= maxId; id++)
        out << "code" << id << " PT_LOAD" << ";\n";
    out << "data" << " PT_LOAD" << ";\n";
    out << "}\nSECTIONS\n{\n";

    if(stripMacsbug)
    {
        out << "\t.strippedmacsbugnames 0 (NOLOAD) : { *(.text.*.macsbug) }\n";
        out << "\t. = 0;\n";
    }

    for(SegmentInfo& seg: segments)
    {
        seg.CreateLdScript(out, entryPoint);
    }

    out << boost::replace_all_copy<string>(boost::replace_all_copy<string>(scriptEnd, "@data_segment@", "data"), "@bss_segment@", "data");
}
