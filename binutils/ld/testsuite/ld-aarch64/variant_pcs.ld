/* Script for .variant_pcs symbol tests.  */
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
  . = 0x9000;
  .rela.plt       : { *(.rela.plt) *(.rela.iplt) }
  . = 0x10000;
  .plt            : { *(.plt) }
  . = 0x11000;
  .text           :
  {
    *(.before)
    *(.text)
    *(.after)
  }

  /* Start of the Read Write Data region.  */
  . = ALIGN (CONSTANT (MAXPAGESIZE));
  .dynamic        : { *(.dynamic) }
  . = ALIGN(4K);
  .got            : { *(.got) *(.got.plt)}

  /* Start of the metadata region.  */
  .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) }
}
