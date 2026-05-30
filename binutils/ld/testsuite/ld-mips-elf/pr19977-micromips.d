#name: pr19977 microMIPS
#source: ../../../gas/testsuite/gas/mips/pr19977.s
#as: -mmicromips -march=mips64r2
#objdump: -d
#ld: -Tpr19977.ld -e 0 -N
#notarget: mips*el-ps2-elf*

.*:     file format elf.*mips.*

Disassembly of section \.text:

10000000 <[^>]*>:
10000000:	3060 1122 	li	v1,4386
10000004:	0063 8000 	sll	v1,v1,0x10
10000008:	3063 2988 	addiu	v1,v1,10632
1000000c:	3060 1122 	li	v1,4386
10000010:	0063 8000 	sll	v1,v1,0x10
10000014:	3063 1988 	addiu	v1,v1,6536
10000018:	3060 1122 	li	v1,4386
1000001c:	0063 8000 	sll	v1,v1,0x10
10000020:	3063 a988 	addiu	v1,v1,-22136
10000024:	3060 1122 	li	v1,4386
10000028:	0063 8000 	sll	v1,v1,0x10
1000002c:	3063 9988 	addiu	v1,v1,-26232
#pass
