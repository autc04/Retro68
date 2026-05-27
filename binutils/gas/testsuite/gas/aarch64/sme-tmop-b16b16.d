#as: -march=armv8-a+sme-tmop+sme-b16b16
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	81600008 	bftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z20\[0\]
 *[0-9a-f]+:	81600009 	bftmopa	za1\.h, {z0\.h-z1\.h}, z0\.h, z20\[0\]
 *[0-9a-f]+:	816003c8 	bftmopa	za0\.h, {z30\.h-z31\.h}, z0\.h, z20\[0\]
 *[0-9a-f]+:	817f0008 	bftmopa	za0\.h, {z0\.h-z1\.h}, z31\.h, z20\[0\]
 *[0-9a-f]+:	81600c08 	bftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z23\[0\]
 *[0-9a-f]+:	81601008 	bftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z28\[0\]
 *[0-9a-f]+:	81601c08 	bftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z31\[0\]
 *[0-9a-f]+:	81600038 	bftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z20\[3\]
