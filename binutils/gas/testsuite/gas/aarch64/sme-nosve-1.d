#as: -march=armv8-a+sme
#as: -march=armv8-a+sme+nosve
#as: -march=armv8-a+sme+nosve2
#as: -march=armv9-a+sme+nosve
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	04d6a441 	abs	z1\.d, p1/m, z2\.d
 *[0-9a-f]+:	4503d041 	adclb	z1\.s, z2\.s, z3\.s
 *[0-9a-f]+:	c0904460 	addha	za0\.s, p1/m, p2/m, z3\.s
