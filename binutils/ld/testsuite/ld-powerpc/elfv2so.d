#source: elfv2.s
#as: -a64
#ld: -melf64ppc -shared
#objdump: -dr

.*

Disassembly of section \.text:

0+300 <.*\.plt_call\.f4>:
.*:	(18 00 41 f8|f8 41 00 18) 	std     r2,24\(r1\)
.*:	(38 80 82 e9|e9 82 80 38) 	ld      r12,-32712\(r2\)
.*:	(a6 03 89 7d|7d 89 03 a6) 	mtctr   r12
.*:	(20 04 80 4e|4e 80 04 20) 	bctr

0+310 <.*\.plt_call\.f3>:
.*:	(18 00 41 f8|f8 41 00 18) 	std     r2,24\(r1\)
.*:	(28 80 82 e9|e9 82 80 28) 	ld      r12,-32728\(r2\)
.*:	(a6 03 89 7d|7d 89 03 a6) 	mtctr   r12
.*:	(20 04 80 4e|4e 80 04 20) 	bctr

0+320 <.*\.plt_call\.f2>:
.*:	(18 00 41 f8|f8 41 00 18) 	std     r2,24\(r1\)
.*:	(30 80 82 e9|e9 82 80 30) 	ld      r12,-32720\(r2\)
.*:	(a6 03 89 7d|7d 89 03 a6) 	mtctr   r12
.*:	(20 04 80 4e|4e 80 04 20) 	bctr

0+330 <.*\.plt_call\.f1>:
.*:	(18 00 41 f8|f8 41 00 18) 	std     r2,24\(r1\)
.*:	(40 80 82 e9|e9 82 80 40) 	ld      r12,-32704\(r2\)
.*:	(a6 03 89 7d|7d 89 03 a6) 	mtctr   r12
.*:	(20 04 80 4e|4e 80 04 20) 	bctr

0+340 <f1>:
.*:	(02 00 4c 3c|3c 4c 00 02) 	addis   r2,r12,2
.*:	(e0 81 42 38|38 42 81 e0) 	addi    r2,r2,-32288
.*:	(a6 02 08 7c|7c 08 02 a6) 	mflr    r0
.*:	(e1 ff 21 f8|f8 21 ff e1) 	stdu    r1,-32\(r1\)
.*:	(30 00 01 f8|f8 01 00 30) 	std     r0,48\(r1\)
.*:	(dd ff ff 4b|4b ff ff dd) 	bl      .*\.plt_call\.f1>
.*:	(08 80 62 e8|e8 62 80 08) 	ld      r3,-32760\(r2\)
.*:	(c5 ff ff 4b|4b ff ff c5) 	bl      .*\.plt_call\.f2>
.*:	(18 00 41 e8|e8 41 00 18) 	ld      r2,24\(r1\)
.*:	(10 80 62 e8|e8 62 80 10) 	ld      r3,-32752\(r2\)
.*:	(a9 ff ff 4b|4b ff ff a9) 	bl      .*\.plt_call\.f3>
.*:	(18 00 41 e8|e8 41 00 18) 	ld      r2,24\(r1\)
.*:	(91 ff ff 4b|4b ff ff 91) 	bl      .*\.plt_call\.f4>
.*:	(18 00 41 e8|e8 41 00 18) 	ld      r2,24\(r1\)
.*:	(30 00 01 e8|e8 01 00 30) 	ld      r0,48\(r1\)
.*:	(20 00 21 38|38 21 00 20) 	addi    r1,r1,32
.*:	(a6 03 08 7c|7c 08 03 a6) 	mtlr    r0
.*:	(20 00 80 4e|4e 80 00 20) 	blr
.*:	(a0 01 01 00|00 00 00 00) 	.*
.*:	(00 00 00 00|00 01 01 a0) 	.*

0+390 <__glink_PLTresolve>:
.*:	(a6 02 08 7c|7c 08 02 a6) 	mflr    r0
.*:	(05 00 9f 42|42 9f 00 05) 	bcl     .*
.*:	(a6 02 68 7d|7d 68 02 a6) 	mflr    r11
.*:	(f0 ff 4b e8|e8 4b ff f0) 	ld      r2,-16\(r11\)
.*:	(a6 03 08 7c|7c 08 03 a6) 	mtlr    r0
.*:	(50 60 8b 7d|7d 8b 60 50) 	subf    r12,r11,r12
.*:	(14 5a 62 7d|7d 62 5a 14) 	add     r11,r2,r11
.*:	(d0 ff 0c 38|38 0c ff d0) 	addi    r0,r12,-48
.*:	(00 00 8b e9|e9 8b 00 00) 	ld      r12,0\(r11\)
.*:	(82 f0 00 78|78 00 f0 82) 	rldicl  r0,r0,62,2
.*:	(a6 03 89 7d|7d 89 03 a6) 	mtctr   r12
.*:	(08 00 6b e9|e9 6b 00 08) 	ld      r11,8\(r11\)
.*:	(20 04 80 4e|4e 80 04 20) 	bctr
.*:	(00 00 00 60|60 00 00 00) 	nop

.* <f3@plt>:
.*:	(c8 ff ff 4b|4b ff ff c8) 	b       .* <__glink_PLTresolve>

.* <f2@plt>:
.*:	(c4 ff ff 4b|4b ff ff c4) 	b       .* <__glink_PLTresolve>

.* <f4@plt>:
.*:	(c0 ff ff 4b|4b ff ff c0) 	b       .* <__glink_PLTresolve>

.* <f1@plt>:
.*:	(bc ff ff 4b|4b ff ff bc) 	b       .* <__glink_PLTresolve>
