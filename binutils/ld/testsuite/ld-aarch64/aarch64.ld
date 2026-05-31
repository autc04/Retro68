/* Script for ld testsuite */
OUTPUT_ARCH(aarch64)
ENTRY(_start)
SECTIONS
{
  PROVIDE (__executable_start = 0x8000);
  . = SEGMENT_START("text-segment", 0x8000) + SIZEOF_HEADERS;
  /* Start of the executable code region.  */
  . = 0x9000;
  .plt              : ALIGN(16) { *(.plt) *(.iplt) }
  . = 0x10000;
  .text             :
  {
    *(.before)
    *(.text)
    *(.after)
  } =0
  . = 0x12340000;
  .far              : { *(.far) }
  /* Start of the Read Write Data region.  */
  . = ALIGN (CONSTANT (MAXPAGESIZE)) - ((CONSTANT (MAXPAGESIZE) - .) & (CONSTANT (MAXPAGESIZE) - 1));
  .got              : { *(.got) *(.got.plt)}
  /* Start of the metadata region.  */
  .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) }
}
