#source: pie1.s
#as: --32
#ld: -pie -melf_i386 -z relro
#objdump: -dw --sym
#target: i?86-*-nacl* x86_64-*-nacl*

.*: +file format .*

SYMBOL TABLE:
#...
10020000 l     O .got.plt	0+ _GLOBAL_OFFSET_TABLE_
#...

Disassembly of section .text:

0+ <_start>:
 +0:	8d 80 00 00 fe ef    	lea    -0x10020000\(%eax\),%eax
#pass
