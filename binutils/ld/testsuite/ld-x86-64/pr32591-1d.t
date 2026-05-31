SECTIONS {
  .text.foo 0x02000 : { *(.text.foo) }
  .text 0x3000 : { *(.text) }
  .got 0x4000 : { *(.got) }
  foo 0x7fffffff : { *(foo) }
  data 0x80001000 : { *(data) }
}
