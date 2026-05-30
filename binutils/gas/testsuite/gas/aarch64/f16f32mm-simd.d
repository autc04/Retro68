#as: -march=armv8-a+f16f32mm
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	4e40ec00 	fmmla	v0.4s, v0.8h, v0.8h
 *[0-9a-f]+:	4e40ec1f 	fmmla	v31.4s, v0.8h, v0.8h
 *[0-9a-f]+:	4e40efe0 	fmmla	v0.4s, v31.8h, v0.8h
 *[0-9a-f]+:	4e5fec00 	fmmla	v0.4s, v0.8h, v31.8h
