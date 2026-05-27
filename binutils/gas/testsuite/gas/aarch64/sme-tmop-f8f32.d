#as: -march=armv8-a+sme-tmop+sme-f8f32
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	80600000 	ftmopa	za0\.s, {z0\.b-z1\.b}, z0\.b, z20\[0\]
 *[0-9a-f]+:	80600003 	ftmopa	za3\.s, {z0\.b-z1\.b}, z0\.b, z20\[0\]
 *[0-9a-f]+:	806003c0 	ftmopa	za0\.s, {z30\.b-z31\.b}, z0\.b, z20\[0\]
 *[0-9a-f]+:	807f0000 	ftmopa	za0\.s, {z0\.b-z1\.b}, z31\.b, z20\[0\]
 *[0-9a-f]+:	80600c00 	ftmopa	za0\.s, {z0\.b-z1\.b}, z0\.b, z23\[0\]
 *[0-9a-f]+:	80601000 	ftmopa	za0\.s, {z0\.b-z1\.b}, z0\.b, z28\[0\]
 *[0-9a-f]+:	80601c00 	ftmopa	za0\.s, {z0\.b-z1\.b}, z0\.b, z31\[0\]
 *[0-9a-f]+:	80600030 	ftmopa	za0\.s, {z0\.b-z1\.b}, z0\.b, z20\[3\]
