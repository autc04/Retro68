#objdump: -dr --prefix-addresses --show-raw-insn
#as: -mabi=32 -march=mips1 -mno-pdr --defsym micromips=1
#name: MIPS and microMIPS TLS HI/LO REL relocation addends
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
0000001c <[^>]*> 3040 5678 	li	v0,22136
			1c: R_MICROMIPS_LO16	var1
00000020 <[^>]*> 3060 9384 	li	v1,-27772
			20: R_MICROMIPS_LO16	var1
00000024 <[^>]*> 3080 5678 	li	a0,22136
			24: R_MICROMIPS_TLS_DTPREL_LO16	var2
00000028 <[^>]*> 30a0 9384 	li	a1,-27772
			28: R_MICROMIPS_TLS_DTPREL_LO16	var2
0000002c <[^>]*> 30c0 5678 	li	a2,22136
			2c: R_MICROMIPS_TLS_TPREL_LO16	var3
00000030 <[^>]*> 459f      	jr	ra
00000032 <[^>]*> 30e0 9384 	li	a3,-27772
			32: R_MICROMIPS_TLS_TPREL_LO16	var3
	\.\.\.
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
00000054 <[^>]*> 30e0 b1a3 	li	a3,-20061
			54: R_MICROMIPS_TLS_TPREL_HI16	var3
00000058 <[^>]*> 30c0 1234 	li	a2,4660
			58: R_MICROMIPS_TLS_TPREL_HI16	var3
0000005c <[^>]*> 30a0 b1a3 	li	a1,-20061
			5c: R_MICROMIPS_TLS_DTPREL_HI16	var2
00000060 <[^>]*> 3080 1234 	li	a0,4660
			60: R_MICROMIPS_TLS_DTPREL_HI16	var2
00000064 <[^>]*> 3060 b1a3 	li	v1,-20061
			64: R_MICROMIPS_HI16	var1
00000068 <[^>]*> 459f      	jr	ra
0000006a <[^>]*> 3040 1234 	li	v0,4660
			6a: R_MICROMIPS_HI16	var1
	\.\.\.
