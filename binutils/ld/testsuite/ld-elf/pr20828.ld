SECTIONS
{
  .data :
  {
    fdata = .;
    *(.data)
    edata = .;
  }
  .dynamic : { *(.dynamic) }
  .hash : { *(.hash) }
  .dynsym : { *(.dynsym) }
  .dynstr : { *(.dynstr) }
  .shstrtab : { *(.shstrtab) }
  .symtab : { *(.symtab) }
  .strtab : { *(.strtab) }
  .plt : { *(.plt) }
  .got.plt : { *(.got.plt) }
  .got : { *(.got) }
  /DISCARD/ : { *(*) }
}
