#as:
#objdump: -d
#skip: loongarch32-*-*
#warning_output: negative_right_shift.l

.*:     file format .*


Disassembly of section \.text:

0+ <directives>:
   0:	03400000 	nop
   4:	00000001 	\.word		0x00000001
   8:	00000001 	\.word		0x00000001

0+c <insns>:
   c:	02bff9ac 	addi.w      	\$t0, \$t1, -2
  10:	02fff9ac 	addi.d      	\$t0, \$t1, -2
  14:	13fff9ac 	addu16i.d   	\$t0, \$t1, -2
  18:	15ffffcc 	lu12i.w     	\$t0, -2
  1c:	17ffffcc 	lu32i.d     	\$t0, -2
  20:	033ff9ac 	lu52i.d     	\$t0, \$t1, -2
  24:	023ff9ac 	slti        	\$t0, \$t1, -2
  28:	027ff9ac 	sltui       	\$t0, \$t1, -2
  2c:	19ffffcc 	pcaddi      	\$t0, -2
  30:	1dffffcc 	pcaddu12i   	\$t0, -2
  34:	1fffffcc 	pcaddu18i   	\$t0, -2
  38:	1bffffcc 	pcalau12i   	\$t0, -2
  3c:	02bffdac 	addi.w      	\$t0, \$t1, -1
  40:	02fffdac 	addi.d      	\$t0, \$t1, -1
  44:	13fffdac 	addu16i.d   	\$t0, \$t1, -1
  48:	15ffffec 	lu12i.w     	\$t0, -1
  4c:	17ffffec 	lu32i.d     	\$t0, -1
  50:	033ffdac 	lu52i.d     	\$t0, \$t1, -1
  54:	023ffdac 	slti        	\$t0, \$t1, -1
  58:	027ffdac 	sltui       	\$t0, \$t1, -1
  5c:	19ffffec 	pcaddi      	\$t0, -1
  60:	1dffffec 	pcaddu12i   	\$t0, -1
  64:	1fffffec 	pcaddu18i   	\$t0, -1
  68:	1bffffec 	pcalau12i   	\$t0, -1
