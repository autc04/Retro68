SECTIONS
{
  .data 0x1000 :
  {
    *(.data)
  }

  foo = 0x10;
  foo_2 = foo;
  PROVIDE (foo = 0x20);
}
