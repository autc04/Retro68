#as: -march=armv8-a+sve
#as: -march=armv8-a+ssve-fexpa
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	0460b800 	fexpa	z0\.h, z0\.h
 *[0-9a-f]+:	0460b81f 	fexpa	z31\.h, z0\.h
 *[0-9a-f]+:	0460bbe0 	fexpa	z0\.h, z31\.h
 *[0-9a-f]+:	04a0b800 	fexpa	z0\.s, z0\.s
 *[0-9a-f]+:	04a0b81f 	fexpa	z31\.s, z0\.s
 *[0-9a-f]+:	04a0bbe0 	fexpa	z0\.s, z31\.s
 *[0-9a-f]+:	04e0b800 	fexpa	z0\.d, z0\.d
 *[0-9a-f]+:	04e0b81f 	fexpa	z31\.d, z0\.d
 *[0-9a-f]+:	04e0bbe0 	fexpa	z0\.d, z31\.d
