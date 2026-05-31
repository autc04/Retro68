#as: -mthin-add-sub
#objdump: -dr
#skip: loongarch64-*-*

.*:[    ]+file format .*


Disassembly of section .text:

0+ <.*>:
   0:	4c0050a4 	jirl        	\$a0, \$a1, 80
			0: R_LARCH_B16	.L1
   4:	50004c00 	b           	76	# 50 <.L1>
			4: R_LARCH_B26	.L1
   8:	14000004 	lu12i.w     	\$a0, 0
			8: R_LARCH_ABS_HI20	.L1
   c:	038000a4 	ori         	\$a0, \$a1, 0x0
			c: R_LARCH_ABS_LO12	.L1
  10:	1a000004 	pcalau12i   	\$a0, 0
			10: R_LARCH_PCALA_HI20	.L1
  14:	02800085 	addi.w      	\$a1, \$a0, 0
			14: R_LARCH_PCALA_LO12	.L1
  18:	1a000004 	pcalau12i   	\$a0, 0
			18: R_LARCH_GOT_PC_HI20	.L1
  1c:	28800085 	ld.w        	\$a1, \$a0, 0
			1c: R_LARCH_GOT_PC_LO12	.L1
  20:	14000004 	lu12i.w     	\$a0, 0
			20: R_LARCH_GOT_HI20	.L1
  24:	03800084 	ori         	\$a0, \$a0, 0x0
			24: R_LARCH_GOT_LO12	.L1
  28:	14000004 	lu12i.w     	\$a0, 0
			28: R_LARCH_TLS_LE_HI20	TLSL1
			28: R_LARCH_RELAX	\*ABS\*
  2c:	03800085 	ori         	\$a1, \$a0, 0x0
			2c: R_LARCH_TLS_LE_LO12	TLSL1
			2c: R_LARCH_RELAX	\*ABS\*
  30:	1a000004 	pcalau12i   	\$a0, 0
			30: R_LARCH_TLS_IE_PC_HI20	TLSL1
  34:	02c00005 	li.d        	\$a1, 0
			34: R_LARCH_TLS_IE_PC_LO12	TLSL1
  38:	14000004 	lu12i.w     	\$a0, 0
			38: R_LARCH_TLS_IE_HI20	TLSL1
  3c:	03800084 	ori         	\$a0, \$a0, 0x0
			3c: R_LARCH_TLS_IE_LO12	TLSL1
  40:	1a000004 	pcalau12i   	\$a0, 0
			40: R_LARCH_TLS_LD_PC_HI20	TLSL1
  44:	14000004 	lu12i.w     	\$a0, 0
			44: R_LARCH_TLS_LD_HI20	TLSL1
  48:	1a000004 	pcalau12i   	\$a0, 0
			48: R_LARCH_TLS_GD_PC_HI20	TLSL1
  4c:	14000004 	lu12i.w     	\$a0, 0
			4c: R_LARCH_TLS_GD_HI20	TLSL1

0+50 <.L1>:
  50:	00000000 	.word		0x00000000
			50: R_LARCH_32_PCREL	.L2

0+54 <.L2>:
  54:	03400000 	nop
  58:	03400000 	nop
			58: R_LARCH_ALIGN	.*
  5c:	03400000 	nop
  60:	03400000 	nop
  64:	1800000c 	pcaddi      	\$t0, 0
			64: R_LARCH_PCREL20_S2	.L1
  68:	1a000004 	pcalau12i   	\$a0, 0
			68: R_LARCH_TLS_DESC_PC_HI20	TLSL1
  6c:	028000a5 	addi.w      	\$a1, \$a1, 0
			6c: R_LARCH_TLS_DESC_PC_LO12	TLSL1
  70:	14000004 	lu12i.w     	\$a0, 0
			70: R_LARCH_TLS_DESC_HI20	TLSL1
  74:	03800084 	ori         	\$a0, \$a0, 0x0
			74: R_LARCH_TLS_DESC_LO12	TLSL1
  78:	28800081 	ld.w        	\$ra, \$a0, 0
			78: R_LARCH_TLS_DESC_LD	TLSL1
  7c:	4c000021 	jirl        	\$ra, \$ra, 0
			7c: R_LARCH_TLS_DESC_CALL	TLSL1
0+80 <NEW>:
  80:	1c000001 	pcaddu12i   	\$ra, 0
			80: R_LARCH_CALL30	\.L1
			80: R_LARCH_RELAX	\*ABS\*
  84:	4c000021 	jirl        	\$ra, \$ra, 0
  88:	1c000001 	pcaddu12i   	\$ra, 0
			88: R_LARCH_CALL30	\.L1
			88: R_LARCH_RELAX	\*ABS\*
  8c:	4c000020 	ret

0+90 <\.Lpcadd_hi0>:
  90:	1c000004 	pcaddu12i   	\$a0, 0
			90: R_LARCH_PCADD_HI20	s
  94:	02800084 	addi.w      	\$a0, \$a0, 0
			94: R_LARCH_PCADD_LO12	\.Lpcadd_hi0

0+98 <\.Lpcadd_hi1>:
  98:	1c000004 	pcaddu12i   	\$a0, 0
			98: R_LARCH_GOT_PCADD_HI20	s
  9c:	28800084 	ld.w        	\$a0, \$a0, 0
			9c: R_LARCH_GOT_PCADD_LO12	\.Lpcadd_hi1

0+a0 <\.Lpcadd_hi2>:
  a0:	1c000004 	pcaddu12i   	\$a0, 0
			a0: R_LARCH_TLS_IE_PCADD_HI20	TLSL1
  a4:	28800084 	ld.w        	\$a0, \$a0, 0
			a4: R_LARCH_TLS_IE_PCADD_LO12	\.Lpcadd_hi2

0+a8 <\.Lpcadd_hi3>:
  a8:	1c000004 	pcaddu12i   	\$a0, 0
			a8: R_LARCH_TLS_LD_PCADD_HI20	TLSL1
  ac:	02800084 	addi.w      	\$a0, \$a0, 0
			ac: R_LARCH_TLS_LD_PCADD_LO12	\.Lpcadd_hi3

0+b0 <\.Lpcadd_hi4>:
  b0:	1c000004 	pcaddu12i   	\$a0, 0
			b0: R_LARCH_TLS_GD_PCADD_HI20	TLSL1
  b4:	02800084 	addi.w      	\$a0, \$a0, 0
			b4: R_LARCH_TLS_GD_PCADD_LO12	\.Lpcadd_hi4

0+b8 <\.Lpcadd_hi5>:
  b8:	1c000004 	pcaddu12i   	\$a0, 0
			b8: R_LARCH_TLS_DESC_PCADD_HI20	TLS1
  bc:	02800084 	addi.w      	\$a0, \$a0, 0
			bc: R_LARCH_TLS_DESC_PCADD_LO12	\.Lpcadd_hi5
  c0:	28800081 	ld.w        	\$ra, \$a0, 0
			c0: R_LARCH_TLS_DESC_LD	TLS1
  c4:	4c000021 	jirl        	\$ra, \$ra, 0
			c4: R_LARCH_TLS_DESC_CALL	TLS1
