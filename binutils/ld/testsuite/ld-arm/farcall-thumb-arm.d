.*:     file format .*

Disassembly of section .text:

00001000 <_start>:
    1000:	f000 f802 	bl	1008 <__bar_from_thumb>
    1004:	0000      	lsls	r0, r0, #0
	\.\.\.

00001008 <__bar_from_thumb>:
    1008:	4778      	bx	pc
    100a:	46c0      	nop			; \(mov r8, r8\)
    100c:	e51ff004 	ldr	pc, \[pc, #-4\]	; 1010 <__bar_from_thumb\+0x8>
    1010:	02001014 	.word	0x02001014
    1014:	00000000 	.word	0x00000000
Disassembly of section .foo:

02001014 <bar>:
 2001014:	e12fff1e 	bx	lr
