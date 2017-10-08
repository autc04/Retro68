#name: Illegal Instructions - 3
#as:
#source: illegal-3.s
#objdump: -d

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
   0:	4dc2d4ec 	.inst	0x4dc2d4ec ; undefined
   4:	4de2d4fc 	.inst	0x4de2d4fc ; undefined
   8:	4dc2f4ec 	.inst	0x4dc2f4ec ; undefined
   c:	4de2f4fc 	.inst	0x4de2f4fc ; undefined
