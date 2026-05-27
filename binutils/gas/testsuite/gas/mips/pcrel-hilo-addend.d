#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPSr6 PCHI16/PCLO16 in-place addends (o32)
#as: -mabi=32 -mno-pdr
#source: pcrel-hilo.s

.*: +file format .*mips.*

Disassembly of section \.text:
00000000 <[^>]*> ec9e0000 	auipc	a0,0x0
			0: R_MIPS_PCHI16	bar
00000004 <[^>]*> 3c050000 	lui	a1,0x0
			4: R_MIPS_HI16	baz
00000008 <[^>]*> ecde0000 	auipc	a2,0x0
			8: R_MIPS_PCHI16	bar
0000000c <[^>]*> ecfe0001 	auipc	a3,0x1
			c: R_MIPS_PCHI16	bar
00000010 <[^>]*> 24847ffc 	addiu	a0,a0,32764
			10: R_MIPS_PCLO16	bar
00000014 <[^>]*> 24a50000 	addiu	a1,a1,0
			14: R_MIPS_LO16	baz
00000018 <[^>]*> 24c68008 	addiu	a2,a2,-32760
			18: R_MIPS_PCLO16	bar
0000001c <[^>]*> 24e70000 	addiu	a3,a3,0
			1c: R_MIPS_PCLO16	bar
00000020 <[^>]*> ec9e0001 	auipc	a0,0x1
			20: R_MIPS_PCHI16	bar
00000024 <[^>]*> 3c050000 	lui	a1,0x0
			24: R_MIPS_HI16	baz
00000028 <[^>]*> ecde0001 	auipc	a2,0x1
			28: R_MIPS_PCHI16	bar
0000002c <[^>]*> ecfe0001 	auipc	a3,0x1
			2c: R_MIPS_PCHI16	bar
	\.\.\.
00030030 <[^>]*> 2484801c 	addiu	a0,a0,-32740
			30030: R_MIPS_PCLO16	bar
00030034 <[^>]*> 24a50000 	addiu	a1,a1,0
			30034: R_MIPS_LO16	baz
00030038 <[^>]*> 24c68028 	addiu	a2,a2,-32728
			30038: R_MIPS_PCLO16	bar
0003003c <[^>]*> 24e70020 	addiu	a3,a3,32
			3003c: R_MIPS_PCLO16	bar
00030040 <[^>]*> 2410802c 	li	s0,-32724
			30040: R_MIPS_PCLO16	bar
00030044 <[^>]*> 24110000 	li	s1,0
			30044: R_MIPS_LO16	baz
00030048 <[^>]*> 24128038 	li	s2,-32712
			30048: R_MIPS_PCLO16	bar
0003004c <[^>]*> 24130030 	li	s3,48
			3004c: R_MIPS_PCLO16	bar
00030050 <[^>]*> ec9e0004 	auipc	a0,0x4
			30050: R_MIPS_PCHI16	bar
00030054 <[^>]*> 3c050000 	lui	a1,0x0
			30054: R_MIPS_HI16	baz
00030058 <[^>]*> ecde0004 	auipc	a2,0x4
			30058: R_MIPS_PCHI16	bar
0003005c <[^>]*> ecfe0004 	auipc	a3,0x4
			3005c: R_MIPS_PCHI16	bar
00030060 <[^>]*> 00902021 	addu	a0,a0,s0
00030064 <[^>]*> 00b12821 	addu	a1,a1,s1
00030068 <[^>]*> 00d23021 	addu	a2,a2,s2
0003006c <[^>]*> 00f33821 	addu	a3,a3,s3
00030070 <[^>]*> d81f0000 	jrc	ra
	\.\.\.
