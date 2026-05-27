#as: -march=armv8-a+sme-mop4+sme-f8f16
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	80200008 	fmop4a	za0\.h, z0\.b, z16\.b
 *[0-9a-f]+:	80200009 	fmop4a	za1\.h, z0\.b, z16\.b
 *[0-9a-f]+:	802001c8 	fmop4a	za0\.h, z14\.b, z16\.b
 *[0-9a-f]+:	802e0008 	fmop4a	za0\.h, z0\.b, z30\.b
 *[0-9a-f]+:	80300008 	fmop4a	za0\.h, z0\.b, {z16\.b-z17\.b}
 *[0-9a-f]+:	80300009 	fmop4a	za1\.h, z0\.b, {z16\.b-z17\.b}
 *[0-9a-f]+:	803001c8 	fmop4a	za0\.h, z14\.b, {z16\.b-z17\.b}
 *[0-9a-f]+:	803e0008 	fmop4a	za0\.h, z0\.b, {z30\.b-z31\.b}
 *[0-9a-f]+:	80200208 	fmop4a	za0\.h, {z0\.b-z1\.b}, z16\.b
 *[0-9a-f]+:	80200209 	fmop4a	za1\.h, {z0\.b-z1\.b}, z16\.b
 *[0-9a-f]+:	802003c8 	fmop4a	za0\.h, {z14\.b-z15\.b}, z16\.b
 *[0-9a-f]+:	802e0208 	fmop4a	za0\.h, {z0\.b-z1\.b}, z30\.b
 *[0-9a-f]+:	80300208 	fmop4a	za0\.h, {z0\.b-z1\.b}, {z16\.b-z17\.b}
 *[0-9a-f]+:	80300209 	fmop4a	za1\.h, {z0\.b-z1\.b}, {z16\.b-z17\.b}
 *[0-9a-f]+:	803003c8 	fmop4a	za0\.h, {z14\.b-z15\.b}, {z16\.b-z17\.b}
 *[0-9a-f]+:	803e0208 	fmop4a	za0\.h, {z0\.b-z1\.b}, {z30\.b-z31\.b}
