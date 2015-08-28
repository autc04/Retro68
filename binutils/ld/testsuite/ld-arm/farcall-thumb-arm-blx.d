.*:     file format .*

Disassembly of section .text:

00001000 <_start>:
    1000:	f000 e802 	blx	1008 <__bar_from_thumb>
    1004:	0000      	lsls	r0, r0, #0
	\.\.\.

00001008 <__bar_from_thumb>:
    1008:	e51ff004 	ldr	pc, \[pc, #-4\]	; 100c <__bar_from_thumb\+0x4>
    100c:	02001014 	.word	0x02001014
Disassembly of section .foo:

02001014 <bar>:
 2001014:	e12fff1e 	bx	lr
