OUTPUT_ARCH(aarch64)
ENTRY(_start)
SECTIONS
{
  PROVIDE(__executable_start = 0x8000);
  . = SEGMENT_START("text-segment", 0x8000) + SIZEOF_HEADERS;
  /* Start of the executable code region.  */
  .hash              : { *(.hash) }
  .gnu.hash          : { *(.gnu.hash) }
  .dynsym            : { *(.dynsym) }
  .dynstr            : { *(.dynstr) }
  . = 0x10000;
  .rela.dyn          : { *(.rela.ifunc) }
  .rela.plt          : { *(.rela.plt) *(.rela.iplt) }
  . = 0x18000;
  .plt               : { *(.plt) *(.iplt) }
  . = 0x20000;
  .text              : { *(.text) }
  /* Start of the Read Only Data region.  */
  .note.gnu.property : { *(.note.gnu.property) }

  /* Start of the Read Write Data region.  */
  . = ALIGN (CONSTANT (MAXPAGESIZE));
  .got               : { *(.got) *(.got.plt) }
  /* Start of the metadata region.  */
  .ARM.attributes 0  : { KEEP (*(.ARM.attributes)) }
}
