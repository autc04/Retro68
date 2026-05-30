#name: MIPSr6 PCHI16/PCLO16 relocations
#as: -mno-pdr
#ld: -e 0 --defsym=baz=0xfedcba98 -T pcrel-hilo.ld
#objdump: -m mips:isa64r6 -d
#source: ../../../gas/testsuite/gas/mips/pcrel-hilo.s

.*: +file format (?:.*mips.*|srec)

Disassembly of section \.(?:text|sec1):

0*10000000 <[^>]*>:
 *10000000:	ec9e2456 	auipc	a0,0x2456
 *10000004:	3c05fedd 	lui	a1,0xfedd
 *10000008:	ecde2456 	auipc	a2,0x2456
 *1000000c:	ecfe2457 	auipc	a3,0x2457
 *10000010:	24847fec 	addiu	a0,a0,32748
 *10000014:	24a5ba98 	addiu	a1,a1,-17768
 *10000018:	24c67ff0 	addiu	a2,a2,32752
 *1000001c:	24e7ffe4 	addiu	a3,a3,-28
 *10000020:	ec9e2456 	auipc	a0,0x2456
 *10000024:	3c05fedd 	lui	a1,0xfedd
 *10000028:	ecde2456 	auipc	a2,0x2456
 *1000002c:	ecfe2457 	auipc	a3,0x2457
	\.\.\.
 *10030030:	24847fec 	addiu	a0,a0,32748
 *10030034:	24a5ba98 	addiu	a1,a1,-17768
 *10030038:	24c67ff0 	addiu	a2,a2,32752
 *1003003c:	24e7ffe4 	addiu	a3,a3,-28
 *10030040:	24107fec 	li	s0,32748
 *10030044:	2411ba98 	li	s1,-17768
 *10030048:	24127ff0 	li	s2,32752
 *1003004c:	2413ffe4 	li	s3,-28
 *10030050:	ec9e2456 	auipc	a0,0x2456
 *10030054:	3c05fedd 	lui	a1,0xfedd
 *10030058:	ecde2456 	auipc	a2,0x2456
 *1003005c:	ecfe2457 	auipc	a3,0x2457
 *10030060:	00902021 	addu	a0,a0,s0
 *10030064:	00b12821 	addu	a1,a1,s1
 *10030068:	00d23021 	addu	a2,a2,s2
 *1003006c:	00f33821 	addu	a3,a3,s3
 *10030070:	d81f0000 	jrc	ra
	\.\.\.
