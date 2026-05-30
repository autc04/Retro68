#objdump: -r
#target: [is_elf_format]
# Relocations to functions should point to the symbol, not the section.

.*: +file format .*

RELOCATION RECORDS FOR \[\.text\.2\]:
OFFSET           TYPE              VALUE
0+0 R_AARCH64_CALL26  f1
0+4 R_AARCH64_JUMP26  f1
#...