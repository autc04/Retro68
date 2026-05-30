SECTIONS
{
  . = 0x0500000;
  .text : { *(.text) }
  . = 0x0654320;
  .data : { *(.data) }
  .sdata : { *(.sdata) }
  .MIPS.abiflags : { *(.MIPS.abiflags) }
  . = 0x0765430;
  .bss : { *(.bss) *(COMMON) }
  .sbss : { *(.scommon) *(.sbss) }
  /DISCARD/ : { *(*) }
}
