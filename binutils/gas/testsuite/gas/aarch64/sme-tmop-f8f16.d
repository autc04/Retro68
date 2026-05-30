#as: -march=armv8-a+sme-tmop+sme-f8f16
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	80600008 	ftmopa	za0\.h, {z0\.b-z1\.b}, z0\.b, z20\[0\]
 *[0-9a-f]+:	80600009 	ftmopa	za1\.h, {z0\.b-z1\.b}, z0\.b, z20\[0\]
 *[0-9a-f]+:	806003c8 	ftmopa	za0\.h, {z30\.b-z31\.b}, z0\.b, z20\[0\]
 *[0-9a-f]+:	807f0008 	ftmopa	za0\.h, {z0\.b-z1\.b}, z31\.b, z20\[0\]
 *[0-9a-f]+:	80600c08 	ftmopa	za0\.h, {z0\.b-z1\.b}, z0\.b, z23\[0\]
 *[0-9a-f]+:	80601008 	ftmopa	za0\.h, {z0\.b-z1\.b}, z0\.b, z28\[0\]
 *[0-9a-f]+:	80601c08 	ftmopa	za0\.h, {z0\.b-z1\.b}, z0\.b, z31\[0\]
 *[0-9a-f]+:	80600038 	ftmopa	za0\.h, {z0\.b-z1\.b}, z0\.b, z20\[3\]
