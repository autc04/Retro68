#as: -march=armv8-a+sve2p2+f16mm
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	64a0e000 	fmmla	z0.h, z0.h, z0.h
 *[0-9a-f]+:	64a0e01f 	fmmla	z31.h, z0.h, z0.h
 *[0-9a-f]+:	64a0e3e0 	fmmla	z0.h, z31.h, z0.h
 *[0-9a-f]+:	64bfe000 	fmmla	z0.h, z0.h, z31.h
