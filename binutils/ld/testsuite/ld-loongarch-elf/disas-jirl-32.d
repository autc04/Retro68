#as:
#objdump: -dr
#skip: loongarch64-*-*

.*:[    ]+file format .*


Disassembly of section .text:

0+ <_start>:
   0:	1c000014 	pcaddu12i   	\$t8, 0
			0: R_LARCH_PCADD_HI20	_start
   4:	02800294 	addi.w      	\$t8, \$t8, 0
			4: R_LARCH_PCADD_LO12	.Lpcadd_hi0
   8:	4c000281 	jirl        	\$ra, \$t8, 0
