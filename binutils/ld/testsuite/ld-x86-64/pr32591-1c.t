SECTIONS {
  .text.foo 0x100000 : { *(.text.foo) }
  .text 0x200000 : { *(.text) }
  .got 0x300000 : { *(.got) }
  data 0x400000 : { *(data) }
}
