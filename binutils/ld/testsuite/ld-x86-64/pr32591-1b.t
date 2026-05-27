SECTIONS {
  .text.foo 0x100000 : { *(.text.foo) }
  .text 0x1ff000 : { . = . + 0x1000 ; *(.text) }
  .got 0x300000 : { *(.got) }
  foo 0x7fffffff : { *(foo) }
  data 0x80200000 : { *(data) }
}
