#as: -march=armv8-a+sme-mop4+sme-f16f16
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	81000008 	fmop4a	za0\.h, z0\.h, z16\.h
 *[0-9a-f]+:	81000009 	fmop4a	za1\.h, z0\.h, z16\.h
 *[0-9a-f]+:	810001c8 	fmop4a	za0\.h, z14\.h, z16\.h
 *[0-9a-f]+:	810e0008 	fmop4a	za0\.h, z0\.h, z30\.h
 *[0-9a-f]+:	81100008 	fmop4a	za0\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	81100009 	fmop4a	za1\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	811001c8 	fmop4a	za0\.h, z14\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	811e0008 	fmop4a	za0\.h, z0\.h, {z30\.h-z31\.h}
 *[0-9a-f]+:	81000208 	fmop4a	za0\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	81000209 	fmop4a	za1\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	810003c8 	fmop4a	za0\.h, {z14\.h-z15\.h}, z16\.h
 *[0-9a-f]+:	810e0208 	fmop4a	za0\.h, {z0\.h-z1\.h}, z30\.h
 *[0-9a-f]+:	81100208 	fmop4a	za0\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	81100209 	fmop4a	za1\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	811003c8 	fmop4a	za0\.h, {z14\.h-z15\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	811e0208 	fmop4a	za0\.h, {z0\.h-z1\.h}, {z30\.h-z31\.h}
 *[0-9a-f]+:	81000018 	fmop4s	za0\.h, z0\.h, z16\.h
 *[0-9a-f]+:	81000019 	fmop4s	za1\.h, z0\.h, z16\.h
 *[0-9a-f]+:	810001d8 	fmop4s	za0\.h, z14\.h, z16\.h
 *[0-9a-f]+:	810e0018 	fmop4s	za0\.h, z0\.h, z30\.h
 *[0-9a-f]+:	81100018 	fmop4s	za0\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	81100019 	fmop4s	za1\.h, z0\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	811001d8 	fmop4s	za0\.h, z14\.h, {z16\.h-z17\.h}
 *[0-9a-f]+:	811e0018 	fmop4s	za0\.h, z0\.h, {z30\.h-z31\.h}
 *[0-9a-f]+:	81000218 	fmop4s	za0\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	81000219 	fmop4s	za1\.h, {z0\.h-z1\.h}, z16\.h
 *[0-9a-f]+:	810003d8 	fmop4s	za0\.h, {z14\.h-z15\.h}, z16\.h
 *[0-9a-f]+:	810e0218 	fmop4s	za0\.h, {z0\.h-z1\.h}, z30\.h
 *[0-9a-f]+:	81100218 	fmop4s	za0\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	81100219 	fmop4s	za1\.h, {z0\.h-z1\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	811003d8 	fmop4s	za0\.h, {z14\.h-z15\.h}, {z16\.h-z17\.h}
 *[0-9a-f]+:	811e0218 	fmop4s	za0\.h, {z0\.h-z1\.h}, {z30\.h-z31\.h}
