#name: pr19977 MIPS
#source: ../../../gas/testsuite/gas/mips/pr19977.s
#objdump: -d
#ld: -Tpr19977.ld -e 0 -N

.*:     file format elf.*mips.*

Disassembly of section \.text:

10000000 <[^>]*>:
10000000:	24031122 	li	v1,4386
10000004:	00031c00 	sll	v1,v1,0x10
10000008:	24632988 	addiu	v1,v1,10632
1000000c:	24031122 	li	v1,4386
10000010:	00031c00 	sll	v1,v1,0x10
10000014:	24631988 	addiu	v1,v1,6536
10000018:	24031122 	li	v1,4386
1000001c:	00031c00 	sll	v1,v1,0x10
10000020:	2463a988 	addiu	v1,v1,-22136
10000024:	24031122 	li	v1,4386
10000028:	00031c00 	sll	v1,v1,0x10
1000002c:	24639988 	addiu	v1,v1,-26232
#pass
