.*:     file format .*

Disassembly of section .text:

00001000 <_start>:
    1000:	f000 f802 	bl	1008 <__bar_from_thumb>
    1004:	0000      	lsls	r0, r0, #0
	...

00001008 <__bar_from_thumb>:
    1008:	4778      	bx	pc
    100a:	46c0      	nop			; \(mov r8, r8\)
    100c:	e59fc000 	ldr	ip, \[pc, #0\]	; 1014 <__bar_from_thumb\+0xc>
    1010:	e08cf00f 	add	pc, ip, pc
    1014:	01fffffc 	.word	0x01fffffc

Disassembly of section .foo:

02001014 <bar>:
 2001014:	e12fff1e 	bx	lr
