OUTPUT_ARCH(loongarch)
ENTRY(_start)
SECTIONS
{
  PROVIDE (__executable_start = 0x8000);
  . = 0x10000;
  .text :
  {
    *(.text)
  } =0
  . = 0x2000000;
  .got :
  {
    *(.got.plt) *(.got)
  }
  . = 0x82000000;
  .other :
  {
    *(.other)
  }
  /DISCARD/ :
  {
    *(*)
  }
}
