#objdump: -dr --prefix-addresses --show-raw-insn
#as: -mabi=32 -mips32r6 -mno-pdr
#name: MIPS orphan PCHI16 REL relocation addends
#warning_output: mips-hi16-orphan-addend.l

.*: +file format .*mips.*

Disassembly of section \.text:
00000000 <[^>]*> 24029384 	li	v0,-27772
			0: R_MIPS_PCLO16	var1
00000004 <[^>]*> 03e00009 	jr	ra
00000008 <[^>]*> 24035678 	li	v1,22136
			8: R_MIPS_PCLO16	var2
00000010 <[^>]*> ec5eb1a3 	auipc	v0,0xb1a3
			10: R_MIPS_PCHI16	var1
00000014 <[^>]*> ec7e1234 	auipc	v1,0x1234
			14: R_MIPS_PCHI16	var2
00000018 <[^>]*> 03e00009 	jr	ra
0000001c <[^>]*> 00000000 	nop
	\.\.\.
