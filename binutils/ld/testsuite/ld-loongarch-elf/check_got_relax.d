#ld: -T check_relax_got.ld
#objdump: -D

.*:     file format .*


Disassembly of section .text:

0+10000 <_start>:
   10000:	1a03fe04 	pcalau12i   	\$a0, 8176
   10004:	28c06084 	ld.d        	\$a0, \$a0, 24
   10008:	1a03fe04 	pcalau12i   	\$a0, 8176
   1000c:	28c08084 	ld.d        	\$a0, \$a0, 32
   10010:	1a03fe04 	pcalau12i   	\$a0, 8176
   10014:	28c04084 	ld.d        	\$a0, \$a0, 16

0+10018 <sym_default_1>:
   10018:	00000123 	.word		0x00000123

0+1001c <sym_hidden_1>:
   1001c:	00000123 	.word		0x00000123

0+10020 <sym_protected_1>:
   10020:	00000123 	.word		0x00000123

Disassembly of section .got:

0+2000000 <_GLOBAL_OFFSET_TABLE_>:
	...
 2000008:	00010018 	.word		0x00010018
 200000c:	00000000 	.word		0x00000000
 2000010:	82000020 	.word		0x82000020
 2000014:	00000000 	.word		0x00000000
 2000018:	82000018 	.word		0x82000018
 200001c:	00000000 	.word		0x00000000
 2000020:	8200001c 	.word		0x8200001c
 2000024:	00000000 	.word		0x00000000
 2000028:	0001001c 	.word		0x0001001c
 200002c:	00000000 	.word		0x00000000
 2000030:	00010020 	asrtle.d    	\$ra, \$zero
 2000034:	00000000 	.word		0x00000000

Disassembly of section .other:

0+82000000 <underflow>:
    82000000:	1b000004 	pcalau12i   	\$a0, -524288
    82000004:	28c02084 	ld.d        	\$a0, \$a0, 8
    82000008:	1b000004 	pcalau12i   	\$a0, -524288
    8200000c:	28c0a084 	ld.d        	\$a0, \$a0, 40
    82000010:	1b000004 	pcalau12i   	\$a0, -524288
    82000014:	28c0c084 	ld.d        	\$a0, \$a0, 48

0+82000018 <sym_default_2>:
    82000018:	00000456 	.word		0x00000456

0+8200001c <sym_hidden_2>:
    8200001c:	00000456 	.word		0x00000456

0+82000020 <sym_protected_2>:
    82000020:	00000456 	.word		0x00000456
