.*:     file format .*

Disassembly of section .text:

00001000 <bar>:
    1000:	4770      	bx	lr

00001002 <baz>:
    1002:	4770      	bx	lr

Disassembly of section .foo:

02001020 <_start>:
 2001020:	f000 f808 	bl	2001034 <__bar_veneer>
 2001024:	f000 f800 	bl	2001028 <__baz_veneer>

02001028 <__baz_veneer>:
 2001028:	f241 0c03 	movw	ip, #4099	@ 0x1003
 200102c:	f2c0 0c00 	movt	ip, #0
 2001030:	4760      	bx	ip
 2001032:	bf00      	nop

02001034 <__bar_veneer>:
 2001034:	f241 0c01 	movw	ip, #4097	@ 0x1001
 2001038:	f2c0 0c00 	movt	ip, #0
 200103c:	4760      	bx	ip
 200103e:	bf00      	nop
	\.\.\.
