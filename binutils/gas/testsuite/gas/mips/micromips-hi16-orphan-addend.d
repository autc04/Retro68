#objdump: -dr --prefix-addresses --show-raw-insn
#as: -mabi=32 -march=mips1 -mno-pdr --defsym micromips=1
#name: MIPS and microMIPS orphan HI16 REL relocation addends
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
00000010 <[^>]*> 3040 5677 	li	v0,22135
			10: R_MICROMIPS_LO16	var1
00000014 <[^>]*> 3080 5677 	li	a0,22135
			14: R_MICROMIPS_TLS_DTPREL_LO16	var2
00000018 <[^>]*> 459f      	jr	ra
0000001a <[^>]*> 30c0 5677 	li	a2,22135
			1a: R_MICROMIPS_TLS_TPREL_LO16	var3
	\.\.\.
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
0000003c <[^>]*> 30e0 b1a3 	li	a3,-20061
			3c: R_MICROMIPS_TLS_TPREL_HI16	var3
00000040 <[^>]*> 30c0 1234 	li	a2,4660
			40: R_MICROMIPS_TLS_TPREL_HI16	var3
00000044 <[^>]*> 30a0 b1a3 	li	a1,-20061
			44: R_MICROMIPS_TLS_DTPREL_HI16	var2
00000048 <[^>]*> 3080 1234 	li	a0,4660
			48: R_MICROMIPS_TLS_DTPREL_HI16	var2
0000004c <[^>]*> 3060 b1a3 	li	v1,-20061
			4c: R_MICROMIPS_HI16	var1
00000050 <[^>]*> 459f      	jr	ra
00000052 <[^>]*> 3040 1234 	li	v0,4660
			52: R_MICROMIPS_HI16	var1
	\.\.\.
