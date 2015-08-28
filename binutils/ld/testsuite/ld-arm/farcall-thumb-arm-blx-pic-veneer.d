.*:     file format .*

Disassembly of section .text:

00001000 <_start>:
    1000:	f000 e802 	blx	1008 <__bar_from_thumb>
    1004:	0000      	lsls	r0, r0, #0
	\.\.\.

00001008 <__bar_from_thumb>:
    1008:	e59fc000 	ldr	ip, \[pc, #0\]	; 1010 <__bar_from_thumb\+0x8>
    100c:	e08ff00c 	add	pc, pc, ip
    1010:	02000000 	.word	0x02000000
    1014:	00000000 	.word	0x00000000
Disassembly of section .foo:

02001014 <bar>:
 2001014:	e12fff1e 	bx	lr
