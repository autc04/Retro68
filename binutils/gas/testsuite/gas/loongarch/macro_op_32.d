#as:
#objdump: -dr
#skip: loongarch64-*-*

.*:     file format .*


Disassembly of section .text:

0+ <.L1>:
   0:	00150004 	move        	\$a0, \$zero
   4:	02bffc04 	li.w        	\$a0, -1
   8:	00150004 	move        	\$a0, \$zero
   c:	02bffc04 	li.w        	\$a0, -1

0+10 <.Lpcadd_hi0>:
  10:	1c000004 	pcaddu12i   	\$a0, 0
			10: R_LARCH_GOT_PCADD_HI20	.L1
			10: R_LARCH_RELAX	\*ABS\*
  14:	28800084 	ld.w        	\$a0, \$a0, 0
			14: R_LARCH_GOT_PCADD_LO12	.Lpcadd_hi0
			14: R_LARCH_RELAX	\*ABS\*

0+18 <.Lpcadd_hi1>:
  18:	1c000004 	pcaddu12i   	\$a0, 0
			18: R_LARCH_GOT_PCADD_HI20	.L1
			18: R_LARCH_RELAX	\*ABS\*
  1c:	28800084 	ld.w        	\$a0, \$a0, 0
			1c: R_LARCH_GOT_PCADD_LO12	.Lpcadd_hi1
			1c: R_LARCH_RELAX	\*ABS\*

0+20 <.Lpcadd_hi2>:
  20:	1c000004 	pcaddu12i   	\$a0, 0
			20: R_LARCH_PCADD_HI20	.L1
  24:	02800084 	addi.w      	\$a0, \$a0, 0
			24: R_LARCH_PCADD_LO12	.Lpcadd_hi2
  28:	14000004 	lu12i.w     	\$a0, 0
			28: R_LARCH_MARK_LA	\*ABS\*
			28: R_LARCH_ABS_HI20	.L1
  2c:	03800084 	ori         	\$a0, \$a0, 0x0
			2c: R_LARCH_ABS_LO12	.L1

0+30 <.Lpcadd_hi3>:
  30:	1c000004 	pcaddu12i   	\$a0, 0
			30: R_LARCH_PCADD_HI20	.L1
  34:	02800084 	addi.w      	\$a0, \$a0, 0
			34: R_LARCH_PCADD_LO12	.Lpcadd_hi3

0+38 <.Lpcadd_hi4>:
  38:	1c000004 	pcaddu12i   	\$a0, 0
			38: R_LARCH_GOT_PCADD_HI20	.L1
			38: R_LARCH_RELAX	\*ABS\*
  3c:	28800084 	ld.w        	\$a0, \$a0, 0
			3c: R_LARCH_GOT_PCADD_LO12	.Lpcadd_hi4
			3c: R_LARCH_RELAX	\*ABS\*
  40:	14000004 	lu12i.w     	\$a0, 0
			40: R_LARCH_TLS_LE_HI20	TLS1
			40: R_LARCH_RELAX	\*ABS\*
  44:	03800084 	ori         	\$a0, \$a0, 0x0
			44: R_LARCH_TLS_LE_LO12	TLS1
			44: R_LARCH_RELAX	\*ABS\*

0+48 <.Lpcadd_hi5>:
  48:	1c000004 	pcaddu12i   	\$a0, 0
			48: R_LARCH_TLS_IE_PCADD_HI20	TLS1
			48: R_LARCH_RELAX	\*ABS\*
  4c:	28800084 	ld.w        	\$a0, \$a0, 0
			4c: R_LARCH_TLS_IE_PCADD_LO12	.Lpcadd_hi5
			4c: R_LARCH_RELAX	\*ABS\*

0+50 <.Lpcadd_hi6>:
  50:	1c000004 	pcaddu12i   	\$a0, 0
			50: R_LARCH_TLS_LD_PCADD_HI20	TLS1
  54:	02800084 	addi.w      	\$a0, \$a0, 0
			54: R_LARCH_TLS_LD_PCADD_LO12	.Lpcadd_hi6

0+58 <.Lpcadd_hi7>:
  58:	1c000004 	pcaddu12i   	\$a0, 0
			58: R_LARCH_TLS_GD_PCADD_HI20	TLS1
  5c:	02800084 	addi.w      	\$a0, \$a0, 0
			5c: R_LARCH_TLS_GD_PCADD_LO12	.Lpcadd_hi7
