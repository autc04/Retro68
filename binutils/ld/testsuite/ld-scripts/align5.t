SECTIONS
{
  .text : {
    SORT_NONE (*) (.text .text.*)
  }

  .data : {
    SORT_NONE (*) (.data .data.*)
    foo = .;
  }
  /DISCARD/ : {*(*)}
}
