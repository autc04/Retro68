/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

OUTPUT_FORMAT("elf32-m68k", "elf32-m68k", "elf32-m68k")
OUTPUT_ARCH(m68k)
INPUT (crti.o crtn.o crt0.o)

SECTIONS
{
	/*
	Start all addresses at 0.
	That way, the relocation is a bit easier when converting to prg.
	*/
	. = 0x0;
	.text : {
		*crti.o(.init)
		*crtbegin.o(.init)
		*crtend.o(.init)
		*crtn.o(.init)
		*crt0.o(.init)
		*crti.o(.fini)
		*crtbegin.o(.fini)
		*crtend.o(.fini)
		*crtn.o(.fini)
		*(.text*)
		*(.gnu.warning)
		FILL(0x0000);
		. = ALIGN(0x4);
	}
	/*
		There is no rodata in a prg file, so we store all data in .data section.
	*/
	.data BLOCK(0x4) : {
		__DATA_SEGMENT__ = .;
		*(.data*);
		. = ALIGN(0x4);
		*(.rodata*);
		. = ALIGN(0x4);

		*(.eh_frame_hdr) *(.eh_frame_entry .eh_frame_entry.*)
		*(.eh_frame) *(.eh_frame.*)
		*(.sframe) *(.sframe.*)
		*(.gcc_except_table .gcc_except_table.*)
		*(.gnu_extab*)

		/*
			All constructors
		*/
		KEEP (*crtbegin.o(.ctors))
		KEEP (*crtbegin?.o(.ctors))
		KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
		KEEP (*(SORT(.ctors.*)))
		KEEP (*(.ctors))

		/*
			All destructors
		*/
		KEEP (*crtbegin.o(.dtors))
		KEEP (*crtbegin?.o(.dtors))
		KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors))
		KEEP (*(SORT(.dtors.*)))
		KEEP (*(.dtors))

		FILL(0x0000);
		. = ALIGN(0x4);
	}
	.bss BLOCK(0x4) : {
		__BSS_SEGMENT__ = .;
		*(.bss);
		. = ALIGN(0x4);
		*(COMMON);
		. = ALIGN(0x4);
	}
	__BSS_SEGMENT_END = .;

	/*
	Atari Prg header.
	We don't care what the address is for this.
	*/
	.prgheader : {
		SHORT(0x601a); 								/* Branch to start of the program  (must be 0x601a, used as magic number!) */
		LONG(__DATA_SEGMENT__);						/* Length of the TEXT segment */
		LONG(__BSS_SEGMENT__ - __DATA_SEGMENT__);	/* Length of the DATA segment */
		LONG(__BSS_SEGMENT_END - __BSS_SEGMENT__);	/* Length of the BSS segment */
		LONG(0);									/* Length of the symbol table */
		LONG(0);									/* Reserved, should be 0 */
		LONG(0);									/* Program flags */
		SHORT(0);									/*  0 = Relocation info present */
	}

	.note.gnu.build-id  : { *(.note.gnu.build-id) }
	.interp         : { *(.interp) }
	.hash           : { *(.hash) }
	.gnu.hash       : { *(.gnu.hash) }
	.dynsym         : { *(.dynsym) }
	.dynstr         : { *(.dynstr) }
	.gnu.version    : { *(.gnu.version) }
	.gnu.version_d  : { *(.gnu.version_d) }
	.gnu.version_r  : { *(.gnu.version_r) }

	/* Stabs debugging sections.  */
	.stab          0 : { *(.stab) }
	.stabstr       0 : { *(.stabstr) }
	.stab.excl     0 : { *(.stab.excl) }
	.stab.exclstr  0 : { *(.stab.exclstr) }
	.stab.index    0 : { *(.stab.index) }
	.stab.indexstr 0 : { *(.stab.indexstr) }
	.comment 0 (INFO) : { *(.comment); LINKER_VERSION; }
	.gnu.build.attributes : { *(.gnu.build.attributes .gnu.build.attributes.*) }

	/* DWARF debug sections.
		Symbols in the DWARF debugging sections are relative to the beginning
		of the section so we begin them at 0.
	*/
	/* DWARF 1.  */
	.debug          0 : { *(.debug) }
	.line           0 : { *(.line) }

	/* GNU DWARF 1 extensions.  */
	.debug_srcinfo  0 : { *(.debug_srcinfo) }
	.debug_sfnames  0 : { *(.debug_sfnames) }

	/* DWARF 1.1 and DWARF 2.  */
	.debug_aranges  0 : { *(.debug_aranges) }
	.debug_pubnames 0 : { *(.debug_pubnames) }

	/* DWARF 2.  */
	.debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
	.debug_abbrev   0 : { *(.debug_abbrev) }
	.debug_line     0 : { *(.debug_line .debug_line.* .debug_line_end) }
	.debug_frame    0 : { *(.debug_frame) }
	.debug_str      0 : { *(.debug_str) }
	.debug_loc      0 : { *(.debug_loc) }
	.debug_macinfo  0 : { *(.debug_macinfo) }

	/* SGI/MIPS DWARF 2 extensions.  */
	.debug_weaknames 0 : { *(.debug_weaknames) }
	.debug_funcnames 0 : { *(.debug_funcnames) }
	.debug_typenames 0 : { *(.debug_typenames) }
	.debug_varnames  0 : { *(.debug_varnames) }

	/* DWARF 3.  */
	.debug_pubtypes 0 : { *(.debug_pubtypes) }
	.debug_ranges   0 : { *(.debug_ranges) }

	/* DWARF 5.  */
	.debug_addr     0 : { *(.debug_addr) }
	.debug_line_str 0 : { *(.debug_line_str) }
	.debug_loclists 0 : { *(.debug_loclists) }
	.debug_macro    0 : { *(.debug_macro) }
	.debug_names    0 : { *(.debug_names) }
	.debug_rnglists 0 : { *(.debug_rnglists) }
	.debug_str_offsets 0 : { *(.debug_str_offsets) }
	.debug_sup      0 : { *(.debug_sup) }
	.gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
	/DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) *(.gnu_object_only) }

}