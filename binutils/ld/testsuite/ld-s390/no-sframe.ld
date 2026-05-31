ENTRY(_start)
SECTIONS
{
  . = SIZEOF_HEADERS;
  .text : { *(.text) }
}
