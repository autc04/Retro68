#name: pr19977 MIPS16
#source: ../../../gas/testsuite/gas/mips/pr19977.s
#as: -mips16 -march=mips3
#objdump: -d
#ld: -Tpr19977.ld -e 0 -N

.*:     file format elf.*mips.*

Disassembly of section \.text:

10000000 <[^>]*>:
10000000:	f122 6b02 	li	v1,4386
10000004:	f400 3360 	sll	v1,16
10000008:	f185 4b08 	addiu	v1,10632
1000000c:	f122 6b02 	li	v1,4386
10000010:	f400 3360 	sll	v1,16
10000014:	f183 4b08 	addiu	v1,6536
10000018:	f122 6b02 	li	v1,4386
1000001c:	f400 3360 	sll	v1,16
10000020:	f195 4b08 	addiu	v1,-22136
10000024:	f122 6b02 	li	v1,4386
10000028:	f400 3360 	sll	v1,16
1000002c:	f193 4b08 	addiu	v1,-26232
#pass
