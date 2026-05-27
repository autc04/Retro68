#as:
#objdump: -r
#skip: loongarch32-*-*

.*:     file format elf64-loongarch

RELOCATION RECORDS FOR \[\.text\]:
OFFSET           TYPE              VALUE
0000000000000000 R_LARCH_PCALA_HI20  _start\+0x7fffabcd12345678
0000000000000004 R_LARCH_PCALA_LO12  _start\+0x7fffabcd12345678
0000000000000008 R_LARCH_PCALA64_LO20  _start\+0x7fffabcd12345678
000000000000000c R_LARCH_PCALA64_HI12  _start\+0x7fffabcd12345678
