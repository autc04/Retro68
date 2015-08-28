#source: tlsmark32.s
#source: tlslib32.s
#as: -a32
#ld: -melf32ppc
#objdump: -dr
#target: powerpc*-*-*

.*:     file format elf32-powerpc

Disassembly of section \.text:

0+1800094 <_start>:
 1800094:	48 00 00 14 	b       18000a8 <_start\+0x14>
 1800098:	38 63 90 00 	addi    r3,r3,-28672
 180009c:	80 83 00 00 	lwz     r4,0\(r3\)
 18000a0:	3c 62 00 00 	addis   r3,r2,0
 18000a4:	48 00 00 0c 	b       18000b0 <_start\+0x1c>
 18000a8:	3c 62 00 00 	addis   r3,r2,0
 18000ac:	4b ff ff ec 	b       1800098 <_start\+0x4>
 18000b0:	38 63 10 00 	addi    r3,r3,4096
 18000b4:	80 83 80 00 	lwz     r4,-32768\(r3\)
 18000b8:	38 7f ff f4 	addi    r3,r31,-12
 18000bc:	3f a0 01 80 	lis     r29,384
 18000c0:	3b bd 00 c8 	addi    r29,r29,200
 18000c4:	48 00 00 05 	bl      18000c8 <__tls_get_addr>

0+18000c8 <__tls_get_addr>:
 18000c8:	4e 80 00 20 	blr
#pass