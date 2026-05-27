#as: -march=armv8-a+sme-tmop+sme-f16f16
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	81400008 	ftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z20\[0\]
 *[0-9a-f]+:	81400009 	ftmopa	za1\.h, {z0\.h-z1\.h}, z0\.h, z20\[0\]
 *[0-9a-f]+:	814003c8 	ftmopa	za0\.h, {z30\.h-z31\.h}, z0\.h, z20\[0\]
 *[0-9a-f]+:	815f0008 	ftmopa	za0\.h, {z0\.h-z1\.h}, z31\.h, z20\[0\]
 *[0-9a-f]+:	81400c08 	ftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z23\[0\]
 *[0-9a-f]+:	81401008 	ftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z28\[0\]
 *[0-9a-f]+:	81401c08 	ftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z31\[0\]
 *[0-9a-f]+:	81400038 	ftmopa	za0\.h, {z0\.h-z1\.h}, z0\.h, z20\[3\]
