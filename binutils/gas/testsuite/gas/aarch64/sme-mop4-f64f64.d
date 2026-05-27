#as: -march=armv8-a+sme-mop4+sme-f64f64
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	80c00008 	fmop4a	za0\.d, z0\.d, z16\.d
 *[0-9a-f]+:	80c0000f 	fmop4a	za7\.d, z0\.d, z16\.d
 *[0-9a-f]+:	80c001c8 	fmop4a	za0\.d, z14\.d, z16\.d
 *[0-9a-f]+:	80ce0008 	fmop4a	za0\.d, z0\.d, z30\.d
 *[0-9a-f]+:	80d00008 	fmop4a	za0\.d, z0\.d, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d0000f 	fmop4a	za7\.d, z0\.d, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d001c8 	fmop4a	za0\.d, z14\.d, {z16\.d-z17\.d}
 *[0-9a-f]+:	80de0008 	fmop4a	za0\.d, z0\.d, {z30\.d-z31\.d}
 *[0-9a-f]+:	80c00208 	fmop4a	za0\.d, {z0\.d-z1\.d}, z16\.d
 *[0-9a-f]+:	80c0020f 	fmop4a	za7\.d, {z0\.d-z1\.d}, z16\.d
 *[0-9a-f]+:	80c003c8 	fmop4a	za0\.d, {z14\.d-z15\.d}, z16\.d
 *[0-9a-f]+:	80ce0208 	fmop4a	za0\.d, {z0\.d-z1\.d}, z30\.d
 *[0-9a-f]+:	80d00208 	fmop4a	za0\.d, {z0\.d-z1\.d}, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d0020f 	fmop4a	za7\.d, {z0\.d-z1\.d}, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d003c8 	fmop4a	za0\.d, {z14\.d-z15\.d}, {z16\.d-z17\.d}
 *[0-9a-f]+:	80de0208 	fmop4a	za0\.d, {z0\.d-z1\.d}, {z30\.d-z31\.d}
 *[0-9a-f]+:	80c00018 	fmop4s	za0\.d, z0\.d, z16\.d
 *[0-9a-f]+:	80c0001f 	fmop4s	za7\.d, z0\.d, z16\.d
 *[0-9a-f]+:	80c001d8 	fmop4s	za0\.d, z14\.d, z16\.d
 *[0-9a-f]+:	80ce0018 	fmop4s	za0\.d, z0\.d, z30\.d
 *[0-9a-f]+:	80d00018 	fmop4s	za0\.d, z0\.d, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d0001f 	fmop4s	za7\.d, z0\.d, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d001d8 	fmop4s	za0\.d, z14\.d, {z16\.d-z17\.d}
 *[0-9a-f]+:	80de0018 	fmop4s	za0\.d, z0\.d, {z30\.d-z31\.d}
 *[0-9a-f]+:	80c00218 	fmop4s	za0\.d, {z0\.d-z1\.d}, z16\.d
 *[0-9a-f]+:	80c0021f 	fmop4s	za7\.d, {z0\.d-z1\.d}, z16\.d
 *[0-9a-f]+:	80c003d8 	fmop4s	za0\.d, {z14\.d-z15\.d}, z16\.d
 *[0-9a-f]+:	80ce0218 	fmop4s	za0\.d, {z0\.d-z1\.d}, z30\.d
 *[0-9a-f]+:	80d00218 	fmop4s	za0\.d, {z0\.d-z1\.d}, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d0021f 	fmop4s	za7\.d, {z0\.d-z1\.d}, {z16\.d-z17\.d}
 *[0-9a-f]+:	80d003d8 	fmop4s	za0\.d, {z14\.d-z15\.d}, {z16\.d-z17\.d}
 *[0-9a-f]+:	80de0218 	fmop4s	za0\.d, {z0\.d-z1\.d}, {z30\.d-z31\.d}
