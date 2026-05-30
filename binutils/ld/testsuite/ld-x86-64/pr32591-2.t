SECTIONS {
  .text  0xffff0000 : { *(.text*) }
  .rodata : AT(ADDR(".rodata") - 0xffff0000) { *(.rodata*) }
}
