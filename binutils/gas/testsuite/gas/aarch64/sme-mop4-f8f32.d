#as: -march=armv8-a+sme-mop4+sme-f8f32
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	80200000 	fmop4a	za0\.s, z0\.b, z16\.b
 *[0-9a-f]+:	80200003 	fmop4a	za3\.s, z0\.b, z16\.b
 *[0-9a-f]+:	802001c0 	fmop4a	za0\.s, z14\.b, z16\.b
 *[0-9a-f]+:	802e0000 	fmop4a	za0\.s, z0\.b, z30\.b
 *[0-9a-f]+:	80300000 	fmop4a	za0\.s, z0\.b, {z16\.b-z17\.b}
 *[0-9a-f]+:	80300003 	fmop4a	za3\.s, z0\.b, {z16\.b-z17\.b}
 *[0-9a-f]+:	803001c0 	fmop4a	za0\.s, z14\.b, {z16\.b-z17\.b}
 *[0-9a-f]+:	803e0000 	fmop4a	za0\.s, z0\.b, {z30\.b-z31\.b}
 *[0-9a-f]+:	80200200 	fmop4a	za0\.s, {z0\.b-z1\.b}, z16\.b
 *[0-9a-f]+:	80200203 	fmop4a	za3\.s, {z0\.b-z1\.b}, z16\.b
 *[0-9a-f]+:	802003c0 	fmop4a	za0\.s, {z14\.b-z15\.b}, z16\.b
 *[0-9a-f]+:	802e0200 	fmop4a	za0\.s, {z0\.b-z1\.b}, z30\.b
 *[0-9a-f]+:	80300200 	fmop4a	za0\.s, {z0\.b-z1\.b}, {z16\.b-z17\.b}
 *[0-9a-f]+:	80300203 	fmop4a	za3\.s, {z0\.b-z1\.b}, {z16\.b-z17\.b}
 *[0-9a-f]+:	803003c0 	fmop4a	za0\.s, {z14\.b-z15\.b}, {z16\.b-z17\.b}
 *[0-9a-f]+:	803e0200 	fmop4a	za0\.s, {z0\.b-z1\.b}, {z30\.b-z31\.b}
