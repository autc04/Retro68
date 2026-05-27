#objdump: -dr --prefix-addresses --show-raw-insn
#as: -mabi=32 -march=mips1 -mno-pdr
#name: MIPS and MIPS16 orphan HI16 REL relocation addends
#warning_output: mips-hi16-orphan-addend.l
#source: mips-hi16-orphan-addend.s

.*: +file format .*mips.*

Disassembly of section \.text:
00000000 <[^>]*> 24025677 	li	v0,22135
			0: R_MIPS_LO16	var1
00000004 <[^>]*> 24045677 	li	a0,22135
			4: R_MIPS_TLS_DTPREL_LO16	var2
00000008 <[^>]*> 03e00008 	jr	ra
0000000c <[^>]*> 24065677 	li	a2,22135
			c: R_MIPS_TLS_TPREL_LO16	var3
00000010 <[^>]*> f66a 6a17 	li	v0,22135
			10: R_MIPS16_LO16	var1
00000014 <[^>]*> f66a 6c17 	li	a0,22135
			14: R_MIPS16_TLS_DTPREL_LO16	var2
00000018 <[^>]*> f66a 6e17 	li	a2,22135
			18: R_MIPS16_TLS_TPREL_LO16	var3
0000001c <[^>]*> e820      	jr	ra
0000001e <[^>]*> 6500      	nop
00000020 <[^>]*> 2407b1a3 	li	a3,-20061
			20: R_MIPS_TLS_TPREL_HI16	var3
00000024 <[^>]*> 24061234 	li	a2,4660
			24: R_MIPS_TLS_TPREL_HI16	var3
00000028 <[^>]*> 2405b1a3 	li	a1,-20061
			28: R_MIPS_TLS_DTPREL_HI16	var2
0000002c <[^>]*> 24041234 	li	a0,4660
			2c: R_MIPS_TLS_DTPREL_HI16	var2
00000030 <[^>]*> 2403b1a3 	li	v1,-20061
			30: R_MIPS_HI16	var1
00000034 <[^>]*> 03e00008 	jr	ra
00000038 <[^>]*> 24021234 	li	v0,4660
			38: R_MIPS_HI16	var1
0000003c <[^>]*> f1b6 6f03 	li	a3,45475
			3c: R_MIPS16_TLS_TPREL_HI16	var3
00000040 <[^>]*> f222 6e14 	li	a2,4660
			40: R_MIPS16_TLS_TPREL_HI16	var3
00000044 <[^>]*> f1b6 6d03 	li	a1,45475
			44: R_MIPS16_TLS_DTPREL_HI16	var2
00000048 <[^>]*> f222 6c14 	li	a0,4660
			48: R_MIPS16_TLS_DTPREL_HI16	var2
0000004c <[^>]*> f1b6 6b03 	li	v1,45475
			4c: R_MIPS16_HI16	var1
00000050 <[^>]*> f222 6a14 	li	v0,4660
			50: R_MIPS16_HI16	var1
00000054 <[^>]*> e820      	jr	ra
00000056 <[^>]*> 6500      	nop
	\.\.\.
