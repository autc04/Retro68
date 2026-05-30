#as: -march=armv8-a+sve-b16mm
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	64e0e000 	bfmmla	z0.h, z0.h, z0.h
 *[0-9a-f]+:	64e0e01f 	bfmmla	z31.h, z0.h, z0.h
 *[0-9a-f]+:	64e0e3e0 	bfmmla	z0.h, z31.h, z0.h
 *[0-9a-f]+:	64ffe000 	bfmmla	z0.h, z0.h, z31.h
