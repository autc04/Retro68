#source: elfv2.s
#as: -a64
#ld: -melf64ppc --defsym f2=0x1234 --defsym f3=0x10008888 --defsym f4=0x1200000 --defsym _start=f1
#objdump: -dr

.*

Disassembly of section \.text:

0+100000c0 <.*\.plt_branch\.f2>:
.*:	(ff ff 62 3d|3d 62 ff ff) 	addis   r11,r2,-1
.*:	(f0 7f 8b e9|e9 8b 7f f0) 	ld      r12,32752\(r11\)
.*:	(a6 03 89 7d|7d 89 03 a6) 	mtctr   r12
.*:	(20 04 80 4e|4e 80 04 20) 	bctr

0+100000d0 <.*\.plt_branch\.f4>:
.*:	(ff ff 62 3d|3d 62 ff ff) 	addis   r11,r2,-1
.*:	(f8 7f 8b e9|e9 8b 7f f8) 	ld      r12,32760\(r11\)
.*:	(a6 03 89 7d|7d 89 03 a6) 	mtctr   r12
.*:	(20 04 80 4e|4e 80 04 20) 	bctr

0+100000e0 <_start>:
.*:	(02 10 40 3c|3c 40 10 02) 	lis     r2,4098
.*:	(40 81 42 38|38 42 81 40) 	addi    r2,r2,-32448
.*:	(a6 02 08 7c|7c 08 02 a6) 	mflr    r0
.*:	(e1 ff 21 f8|f8 21 ff e1) 	stdu    r1,-32\(r1\)
.*:	(30 00 01 f8|f8 01 00 30) 	std     r0,48\(r1\)
.*:	(f5 ff ff 4b|4b ff ff f5) 	bl      .* <_start\+0x8>
.*:	(08 80 62 e8|e8 62 80 08) 	ld      r3,-32760\(r2\)
.*:	(c5 ff ff 4b|4b ff ff c5) 	bl      .*\.plt_branch\.f2>
.*:	(00 00 00 60|60 00 00 00) 	nop
.*:	(10 80 62 e8|e8 62 80 10) 	ld      r3,-32752\(r2\)
.*:	(81 87 00 48|48 00 87 81) 	bl      10008888 <f3>
.*:	(00 00 00 60|60 00 00 00) 	nop
.*:	(c1 ff ff 4b|4b ff ff c1) 	bl      .*\.plt_branch\.f4>
.*:	(00 00 00 60|60 00 00 00) 	nop
.*:	(30 00 01 e8|e8 01 00 30) 	ld      r0,48\(r1\)
.*:	(20 00 21 38|38 21 00 20) 	addi    r1,r1,32
.*:	(a6 03 08 7c|7c 08 03 a6) 	mtlr    r0
.*:	(20 00 80 4e|4e 80 00 20) 	blr
