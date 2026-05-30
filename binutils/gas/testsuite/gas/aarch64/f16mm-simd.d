#as: -march=armv8-a+f16mm
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	4ec0ec00 	fmmla	v0.8h, v0.8h, v0.8h
 *[0-9a-f]+:	4ec0ec1f 	fmmla	v31.8h, v0.8h, v0.8h
 *[0-9a-f]+:	4ec0efe0 	fmmla	v0.8h, v31.8h, v0.8h
 *[0-9a-f]+:	4edfec00 	fmmla	v0.8h, v0.8h, v31.8h
