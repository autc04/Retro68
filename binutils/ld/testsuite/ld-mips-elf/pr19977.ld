MEMORY
{
  text (rx) : ORIGIN = 0x10000000, LENGTH = 0x40000
  data (w) : ORIGIN = 0x34560000, LENGTH = 0x40000
}
SECTIONS
{
  .text : { *(.text) } >text
  .tdata : { *(.tdata) } >data
  .symtab : { *(.symtab) }
  .strtab : { *(.strtab) }
  .shstrtab : { *(.shstrtab) }
  /DISCARD/ : { *(*) }
}
