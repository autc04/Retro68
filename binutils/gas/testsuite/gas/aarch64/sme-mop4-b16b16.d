#as: -march=armv8-a+sme-mop4+sme-b16b16
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	81200008 	bfmop4a	za0\.h, z0\.h, z16\.h
 *[0-9a-f]+:	81200009 	bfmop4a	za1\.h, z0\.h, z16\.h
 *[0-9a-f]+:	812001c8 	bfmop4a	za0\.h, z14\.h, z16\.h
 *[0-9a-f]+:	812e0008 	bfmop4a	za0\.h, z0\.h, z30\.h
 *[0-9a-f]+:	81300008 	bfmop4a	za0\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	81300009 	bfmop4a	za1\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	813001c8 	bfmop4a	za0\.h, z14\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	813e0008 	bfmop4a	za0\.h, z0\.h, {z30\.h-z31\.h}
 *[0-9a-f]+:	81200208 	bfmop4a	za0\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	81200209 	bfmop4a	za1\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	812003c8 	bfmop4a	za0\.h, {z14\.h-z15\.h}, z16\.h
 *[0-9a-f]+:	812e0208 	bfmop4a	za0\.h, {z0\.h-z1\.h}, z30\.h
 *[0-9a-f]+:	81300208 	bfmop4a	za0\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	81300209 	bfmop4a	za1\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	813003c8 	bfmop4a	za0\.h, {z14\.h-z15\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	813e0208 	bfmop4a	za0\.h, {z0\.h-z1\.h}, {z30\.h-z31\.h}
 *[0-9a-f]+:	81200018 	bfmop4s	za0\.h, z0\.h, z16\.h
 *[0-9a-f]+:	81200019 	bfmop4s	za1\.h, z0\.h, z16\.h
 *[0-9a-f]+:	812001d8 	bfmop4s	za0\.h, z14\.h, z16\.h
 *[0-9a-f]+:	812e0018 	bfmop4s	za0\.h, z0\.h, z30\.h
 *[0-9a-f]+:	81300018 	bfmop4s	za0\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	81300019 	bfmop4s	za1\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	813001d8 	bfmop4s	za0\.h, z14\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	813e0018 	bfmop4s	za0\.h, z0\.h, {z30\.h-z31\.h}
 *[0-9a-f]+:	81200218 	bfmop4s	za0\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	81200219 	bfmop4s	za1\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	812003d8 	bfmop4s	za0\.h, {z14\.h-z15\.h}, z16\.h
 *[0-9a-f]+:	812e0218 	bfmop4s	za0\.h, {z0\.h-z1\.h}, z30\.h
 *[0-9a-f]+:	81300218 	bfmop4s	za0\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	81300219 	bfmop4s	za1\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	813003d8 	bfmop4s	za0\.h, {z14\.h-z15\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	813e0218 	bfmop4s	za0\.h, {z0\.h-z1\.h}, {z30\.h-z31\.h}
