MEMORY
{
  text (rx) : ORIGIN = 0x10000000, LENGTH = 0x20000
}
SECTIONS
{
  .text : { *(.text) } >text
  .symtab : { *(.symtab) }
  .strtab : { *(.strtab) }
  .shstrtab : { *(.shstrtab) }
  /DISCARD/ : { *(*) }
}
