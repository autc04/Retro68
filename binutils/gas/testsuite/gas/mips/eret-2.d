#objdump: -d
#name: MIPS eret-2 disassembly
#as: -mfix-24k -march=24kc --no-warn

.*\.o:     file format .*mips.*

Disassembly of section \.text:

00000000 <\.text>:
   0:	42000018 	eret
   4:	00000000 	nop
   8:	1000fffd 	b	0x0
   c:	00000000 	nop
  10:	42000018 	eret
  14:	00000000 	nop
  18:	1000fffd 	b	0x10
