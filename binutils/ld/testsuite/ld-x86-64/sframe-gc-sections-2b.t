# sframe-gc-sections-2b.d checks the same behaviour as
# sframe-gc-sections-2a.d, but with a linker script that discards
# .eh_frame sections.  This testcase is keep it ensured that the two
# section's GC behaviours are not unnecessarily inter-twined.

ENTRY(_start)
SECTIONS
{
  . = SIZEOF_HEADERS;
  .text : { *(.text) }
  .sframe : { KEEP (*(.sframe)) }
  /* Sections to be discarded */
  /DISCARD/ : {
        *(.eh_frame)
        }
}
