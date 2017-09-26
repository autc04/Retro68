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

#include <iostream>
#include <boost/algorithm/string/replace.hpp>
#include <string>

using std::string;

const char * scriptStart = R"ld(/* ld script for Elf2Mac */
ENTRY( _start )
SECTIONS
{
)ld";

const char * textSection = R"ld(/* ld script for Elf2Mac */
    .text :	{
        _stext = . ;
        PROVIDE(_rsrc_start = .);
        *(.rsrcheader)
        . = ALIGN (2);
        
        /* The entry point. */
        _entry_trampoline = .;
        SHORT(DEFINED(__break_on_entry) ? 0xA9FF : 0x4e71);
        LONG(0x61000002);	/* bsr *+2 */
        SHORT(0x0697); /* addi.l #_, (a7) */
        LONG(_start - _entry_trampoline - 6);
        
        PROVIDE(_start = .);  /* fallback entry point to a safe spot - needed for libretro bootstrap */
        Retro68InitMultisegApp = .;    /* override this for the single-segment case */
        SHORT(0x4e75); /* rts */

        *(.relocvars)
        */libretrocrt.a:start.c.obj(.text*)
        */libretrocrt.a:relocate.c.obj(.text*) 
        */libretrocrt.a:*(.text*)
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
    }
)ld";

const char * code1Section = R"ld(/* ld script for Elf2Mac */
    .code1 :	{
        _stext = . ;
        FILL(0x4E71);
        PROVIDE(_rsrc_start = .);
        . = ALIGN (2);
        _entry_trampoline = .;
        SHORT(DEFINED(__break_on_entry) ? 0xA9FF : 0x4e71);
        LONG(0x61000002);	/* bsr *+2 */
        SHORT(0x0697); /* addi.l #_, (a7) */
        LONG(_start - _entry_trampoline - 6);
        PROVIDE(_start = .);  /* fallback entry point to a safe spot - needed for libretro bootstrap */
        SHORT(0x4e75); /* rts */

        *(.relocvars)
        */libretrocrt.a:start.c.obj(.text*)
        */libretrocrt.a:relocate.c.obj(.text*) 
        */libretrocrt.a:MultiSegApp.c.obj(.text*) 
        */libretrocrt.a:LoadSeg.s.obj(.text*) 
        */libretrocrt.a:*(.text*) 
        */libgcc.a:*(.text*) 
        */libc.a:*(.text*)
       
        . = ALIGN (4) ;
        __init_section = . ;
        KEEP (*(.init))
        __init_section_end = . ;
        __fini_section = . ;
        KEEP (*(.fini))
        __fini_section_end = . ;

        __EH_FRAME_BEGIN__ = .;
        KEEP(*/libretrocrt.a:*(.eh_frame))
        KEEP(*/libgcc.a:*(.eh_frame))
        KEEP(*/libc.a:*(.eh_frame))
        LONG(0);
        KEEP(*/libretrocrt.a:*(.gcc_except_table))
        KEEP(*/libretrocrt.a:*(.gcc_except_table.*))
        KEEP(*/libgcc.a:*(.gcc_except_table))
        KEEP(*/libgcc.a:*(.gcc_except_table.*))
        KEEP(*/libc.a:*(.gcc_except_table))
        KEEP(*/libc.a:*(.gcc_except_table.*))

        . = ALIGN(0x4) ;
        _etext = . ;
    }
)ld";
const char * codeSectionTemplate = R"ld(/* ld script for Elf2Mac */
    .code@N@ :	{
        FILL(0x4E71);
        @FILTER@(.text*)

        @EXTRA@

        . = ALIGN (4) ;

        __EH_FRAME_BEGIN__@N@ = .;
        KEEP(@FILTER@(.eh_frame))
        LONG(0);
        KEEP(@FILTER@(.gcc_except_table))
        KEEP(@FILTER@(.gcc_except_table.*))

        . = ALIGN(0x4);
        LONG(0xDEADBEEF);
        . += 32;
        LONG(__EH_FRAME_BEGIN__@N@ - .);
    }
)ld";

const char * lastCodeExtra = R"ld(
        *(.gnu.linkonce.t*)
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
    }
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
    }


    /* **** Debugging information sections.
     * Keep them for now, they are discarded by Elf2Mac. */

    /DISCARD/ : { *(.note.GNU-stack) }
    /* Stabs debugging sections.    */
    .stab 0 : { *(.stab) }
    .stabstr 0 : { *(.stabstr) }
    .stab.excl 0 : { *(.stab.excl) }
    .stab.exclstr 0 : { *(.stab.exclstr) }
    .stab.index 0 : { *(.stab.index) }
    .stab.indexstr 0 : { *(.stab.indexstr) }
    .comment 0 : { *(.comment) }
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
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }
    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames 0 : { *(.debug_weaknames) }
    .debug_funcnames 0 : { *(.debug_funcnames) }
    .debug_typenames 0 : { *(.debug_typenames) }
    .debug_varnames  0 : { *(.debug_varnames) }
    
    /DISCARD/ : { *(*) }
}

)ld";


void CreateLdScript(std::ostream& out, bool segments)
{
	if(segments)
	{
        out << "_MULTISEG_APP = 1;\n";
		out << scriptStart << code1Section;
		string code = codeSectionTemplate;
		boost::replace_all(code, "@N@", "2");
		boost::replace_all(code, "@FILTER@", "*");
		boost::replace_all(code, "@EXTRA@", lastCodeExtra);
		out << code;
		out << scriptEnd;
	}
	else
    {
        out << "_MULTISEG_APP = 0;\n";
		out << scriptStart << textSection << scriptEnd;
    }
}
