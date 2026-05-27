#objdump: -dr --prefix-addresses --show-raw-insn
#as: -mabi=32 -march=mips1 -mno-pdr
#name: MIPS and MIPS16 TLS HI/LO REL relocation addends
#source: mips-tls-hilo-match.s

.*: +file format .*mips.*

Disassembly of section \.text:
00000000 <[^>]*> 24025678 	li	v0,22136
			0: R_MIPS_LO16	var1
00000004 <[^>]*> 24039384 	li	v1,-27772
			4: R_MIPS_LO16	var1
00000008 <[^>]*> 24045678 	li	a0,22136
			8: R_MIPS_TLS_DTPREL_LO16	var2
0000000c <[^>]*> 24059384 	li	a1,-27772
			c: R_MIPS_TLS_DTPREL_LO16	var2
00000010 <[^>]*> 24065678 	li	a2,22136
			10: R_MIPS_TLS_TPREL_LO16	var3
00000014 <[^>]*> 03e00008 	jr	ra
00000018 <[^>]*> 24079384 	li	a3,-27772
			18: R_MIPS_TLS_TPREL_LO16	var3
0000001c <[^>]*> f66a 6a18 	li	v0,22136
			1c: R_MIPS16_LO16	var1
00000020 <[^>]*> f392 6b04 	li	v1,37764
			20: R_MIPS16_LO16	var1
00000024 <[^>]*> f66a 6c18 	li	a0,22136
			24: R_MIPS16_TLS_DTPREL_LO16	var2
00000028 <[^>]*> f392 6d04 	li	a1,37764
			28: R_MIPS16_TLS_DTPREL_LO16	var2
0000002c <[^>]*> f66a 6e18 	li	a2,22136
			2c: R_MIPS16_TLS_TPREL_LO16	var3
00000030 <[^>]*> f392 6f04 	li	a3,37764
			30: R_MIPS16_TLS_TPREL_LO16	var3
00000034 <[^>]*> e820      	jr	ra
00000036 <[^>]*> 6500      	nop
00000038 <[^>]*> 2407b1a3 	li	a3,-20061
			38: R_MIPS_TLS_TPREL_HI16	var3
0000003c <[^>]*> 24061234 	li	a2,4660
			3c: R_MIPS_TLS_TPREL_HI16	var3
00000040 <[^>]*> 2405b1a3 	li	a1,-20061
			40: R_MIPS_TLS_DTPREL_HI16	var2
00000044 <[^>]*> 24041234 	li	a0,4660
			44: R_MIPS_TLS_DTPREL_HI16	var2
00000048 <[^>]*> 2403b1a3 	li	v1,-20061
			48: R_MIPS_HI16	var1
0000004c <[^>]*> 03e00008 	jr	ra
00000050 <[^>]*> 24021234 	li	v0,4660
			50: R_MIPS_HI16	var1
00000054 <[^>]*> f1b6 6f03 	li	a3,45475
			54: R_MIPS16_TLS_TPREL_HI16	var3
00000058 <[^>]*> f222 6e14 	li	a2,4660
			58: R_MIPS16_TLS_TPREL_HI16	var3
0000005c <[^>]*> f1b6 6d03 	li	a1,45475
			5c: R_MIPS16_TLS_DTPREL_HI16	var2
00000060 <[^>]*> f222 6c14 	li	a0,4660
			60: R_MIPS16_TLS_DTPREL_HI16	var2
00000064 <[^>]*> f1b6 6b03 	li	v1,45475
			64: R_MIPS16_HI16	var1
00000068 <[^>]*> f222 6a14 	li	v0,4660
			68: R_MIPS16_HI16	var1
0000006c <[^>]*> e820      	jr	ra
0000006e <[^>]*> 6500      	nop
	\.\.\.
