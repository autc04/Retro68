SECTIONS {
  .text 0xf0000000 : { *(.text) }
  .got 0xff300000 : { *(.got) }
  foo = .;
}
