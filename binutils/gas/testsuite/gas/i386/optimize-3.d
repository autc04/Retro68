#as: -Os
#objdump: -drw
#name: optimized encoding 3 with -Os

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	a9 7f 00 00 00       	test   \$0x7f,%eax
#pass
