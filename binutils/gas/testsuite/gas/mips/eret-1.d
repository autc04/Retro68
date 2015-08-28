#objdump: -d
#name: MIPS eret-1 disassembly
#as: -mfix-24k -march=24kc --no-warn

.*\.o:     file format .*mips.*

Disassembly of section \.text:

00000000 <\.text>:
   0:	240c0000 	li	t4,0
   4:	42000018 	eret
   8:	00000000 	nop
   c:	10000003 	b	0x1c
  10:	00000000 	nop
  14:	240a0003 	li	t2,3
  18:	42000018 	eret
  1c:	24040000 	li	a0,0
  20:	4200001f 	deret
  24:	00000000 	nop
  28:	116afffa 	beq	t3,t2,0x14
  2c:	00000000 	nop
  30:	4200001f 	deret
  34:	00000000 	nop
  38:	42000018 	eret
  3c:	00000000 	nop
  40:	42000018 	eret
  44:	00000000 	nop
  48:	1000fff4 	b	0x1c
  4c:	00000000 	nop
  50:	240c0004 	li	t4,4
  54:	4200001f 	deret
  58:	240c0003 	li	t4,3
  5c:	42000018 	eret
  60:	10000005 	b	0x78
  64:	240c0003 	li	t4,3
  68:	42000018 	eret
  6c:	00000000 	nop
  70:	10000001 	b	0x78
  74:	240c0003 	li	t4,3
  78:	240c0003 	li	t4,3
  7c:	42000018 	eret
