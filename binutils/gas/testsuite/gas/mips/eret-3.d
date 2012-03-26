#objdump: -d
#name: MIPS eret-3 disassembly
#as: -mfix-24k -march=24kc --no-warn

.*\.o:     file format .*mips.*

Disassembly of section \.text:

00000000 <foo>:
   0:	42000018 	eret
   4:	00000000 	nop

00000008 <bar>:
   8:	10800002 	beqz	a0,14 <bar\+0xc>
   c:	00000000 	nop
  10:	aca40000 	sw	a0,0\(a1\)
  14:	03e00008 	jr	ra
  18:	00000000 	nop
