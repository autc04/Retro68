#as: -mfuture
#objdump: -dr -Mfuture
#name: Future tests

.*


Disassembly of section \.text:

0+0 <_start>:
.*:	(90 58 4c 7d|7d 4c 58 90) 	subwus  r10,r11,r12
.*:	(90 58 4c 7d|7d 4c 58 90) 	subwus  r10,r11,r12
.*:	(91 58 4c 7d|7d 4c 58 91) 	subwus\. r10,r11,r12
.*:	(91 58 4c 7d|7d 4c 58 91) 	subwus\. r10,r11,r12
.*:	(90 ac 96 7e|7e 96 ac 90) 	subdus  r20,r21,r22
.*:	(90 ac 96 7e|7e 96 ac 90) 	subdus  r20,r21,r22
.*:	(91 ac 96 7e|7e 96 ac 91) 	subdus\. r20,r21,r22
.*:	(91 ac 96 7e|7e 96 ac 91) 	subdus\. r20,r21,r22
.*:	(1b 5c 4a 7c|7c 4a 5c 1b) 	lxvrl   vs34,r10,r11
.*:	(5b 64 6a 7c|7c 6a 64 5b) 	lxvrll  vs35,r10,r12
.*:	(9a 6c aa 7c|7c aa 6c 9a) 	lxvprl  vs36,r10,r13
.*:	(da 74 ea 7c|7c ea 74 da) 	lxvprll vs38,r10,r14
.*:	(1b 7d 0a 7d|7d 0a 7d 1b) 	stxvrl  vs40,r10,r15
.*:	(5b 85 2a 7d|7d 2a 85 5b) 	stxvrll vs41,r10,r16
.*:	(9a 8d 2a 7d|7d 2a 8d 9a) 	stxvprl vs40,r10,r17
.*:	(da 95 6a 7d|7d 6a 95 da) 	stxvprll vs42,r10,r18
.*:	(c6 9d e9 f3|f3 e9 9d c6) 	xvrlw   vs31,vs41,vs51
.*:	(1e a4 ca f3|f3 ca a4 1e) 	xvadduwm vs30,vs42,vs52
.*:	(5e ac ca f3|f3 ca ac 5e) 	xvadduhm vs30,vs42,vs53
.*:	(9e b4 ab f3|f3 ab b4 9e) 	xvsubuwm vs29,vs43,vs54
.*:	(d9 f4 e0 f3|f3 e0 f4 d9) 	xvsubuhm vs63,vs0,vs30
.*:	(1e e5 c8 f3|f3 c8 e5 1e) 	xvmuluwm vs30,vs40,vs60
.*:	(5f f5 9d f3|f3 9d f5 5f) 	xvmuluhm vs60,vs61,vs62
.*:	(9f 25 43 f0|f0 43 25 9f) 	xvmulhsw vs34,vs35,vs36
.*:	(d8 1d 22 f0|f0 22 1d d8) 	xvmulhsh vs1,vs2,vs3
.*:	(90 b3 95 f2|f2 95 b3 90) 	xvmulhuw vs20,vs21,vs22
.*:	(d6 a3 8a f2|f2 8a a3 d6) 	xvmulhuh vs20,vs42,vs52
.*:	(10 36 44 f0|f0 44 36 10) 	xxaes128encp vs2,vs4,vs6
.*:	(10 36 44 f0|f0 44 36 10) 	xxaes128encp vs2,vs4,vs6
.*:	(12 2e 44 f0|f0 44 2e 12) 	xxaes192encp vs2,vs4,vs36
.*:	(12 2e 44 f0|f0 44 2e 12) 	xxaes192encp vs2,vs4,vs36
.*:	(16 26 23 f0|f0 23 26 16) 	xxaes256encp vs32,vs34,vs36
.*:	(16 26 23 f0|f0 23 26 16) 	xxaes256encp vs32,vs34,vs36
.*:	(50 36 44 f0|f0 44 36 50) 	xxaes128decp vs2,vs4,vs6
.*:	(50 36 44 f0|f0 44 36 50) 	xxaes128decp vs2,vs4,vs6
.*:	(52 2e 44 f0|f0 44 2e 52) 	xxaes192decp vs2,vs4,vs36
.*:	(52 2e 44 f0|f0 44 2e 52) 	xxaes192decp vs2,vs4,vs36
.*:	(56 26 23 f0|f0 23 26 56) 	xxaes256decp vs32,vs34,vs36
.*:	(56 26 23 f0|f0 23 26 56) 	xxaes256decp vs32,vs34,vs36
.*:	(90 96 00 f2|f2 00 96 90) 	xxaes128genlkp vs16,vs18
.*:	(90 96 00 f2|f2 00 96 90) 	xxaes128genlkp vs16,vs18
.*:	(92 9e 20 f1|f1 20 9e 92) 	xxaes192genlkp vs40,vs50
.*:	(92 9e 20 f1|f1 20 9e 92) 	xxaes192genlkp vs40,vs50
.*:	(92 b6 81 f2|f2 81 b6 92) 	xxaes256genlkp vs20,vs54
.*:	(92 b6 81 f2|f2 81 b6 92) 	xxaes256genlkp vs20,vs54
.*:	(d0 1e 22 f0|f0 22 1e d0) 	xxgfmul128gcm vs1,vs2,vs3
.*:	(d0 1e 22 f0|f0 22 1e d0) 	xxgfmul128gcm vs1,vs2,vs3
.*:	(d6 0f e0 f3|f3 e0 0f d6) 	xxgfmul128xts vs31,vs32,vs33
.*:	(d6 0f e0 f3|f3 e0 0f d6) 	xxgfmul128xts vs31,vs32,vs33
.*:	(06 00 00 00|00 00 00 06) 	paddis  r12,r9,15
.*:	(3d 89 00 0f|0f 00 89 3d) 
.*:	(06 00 00 00|00 00 00 06) 	paddis  r12,r9,15
.*:	(3d 89 00 0f|0f 00 89 3d) 
.*:	(06 00 ff ff|ff ff 00 06) 	paddis  r12,r9,-32769
.*:	(3d 89 7f ff|ff 7f 89 3d) 
.*:	(06 00 ff ff|ff ff 00 06) 	paddis  r12,r9,-32769
.*:	(3d 89 7f ff|ff 7f 89 3d) 
.*:	(06 10 00 00|00 00 10 06) 	paddis  r9,0,25,1	# e4
.*:	(3d 20 00 19|19 00 20 3d) 
.*:	(06 00 7f ff|ff 7f 00 06) 	plis    r24,2147483647
.*:	(3f 00 ff ff|ff ff 00 3f) 
.*:	(06 00 7f ff|ff 7f 00 06) 	plis    r24,2147483647
.*:	(3f 00 ff ff|ff ff 00 3f) 
.*:	(60 00 00 00|00 00 00 60) 	nop
.*:	(06 00 7f ff|ff 7f 00 06) 	plis    r24,2147483647
.*:	(3f 00 ff ff|ff ff 00 3f) 
.*:	(06 00 80 00|00 80 00 06) 	paddis  r30,r10,-2147483648
.*:	(3f ca 00 00|00 00 ca 3f) 
.*:	(06 00 80 00|00 80 00 06) 	paddis  r30,r10,-2147483648
.*:	(3f ca 00 00|00 00 ca 3f) 
.*:	(06 00 80 00|00 80 00 06) 	paddis  r30,r10,-2147483648
.*:	(3f ca 00 00|00 00 ca 3f) 
.*:	(60 00 00 00|00 00 00 60) 	nop
.*:	(06 00 7f ff|ff 7f 00 06) 	paddis  r30,r10,2147483647
.*:	(3f ca ff ff|ff ff ca 3f) 
.*:	(06 00 7f ff|ff 7f 00 06) 	paddis  r30,r10,2147483647
.*:	(3f ca ff ff|ff ff ca 3f) 
.*:	(06 00 7f ff|ff 7f 00 06) 	paddis  r30,r10,2147483647
.*:	(3f ca ff ff|ff ff ca 3f) 
.*:	(60 00 00 00|00 00 00 60) 	nop
.*:	(06 10 7f ff|ff 7f 10 06) 	paddis  r15,0,2147483647,1	# 140
.*	(3d e0 ff ff|ff ff e0 3d) 
.*:	(06 10 7f ff|ff 7f 10 06) 	paddis  r15,0,2147483647,1	# 148
.*	(3d e0 ff ff|ff ff e0 3d) 
.*:	(03 a8 b8 11|11 b8 a8 03) 	vucmprhn v13,v24,v21
.*:	(43 b0 b8 11|11 b8 b0 43) 	vucmprln v13,v24,v22
.*:	(83 b0 d8 11|11 d8 b0 83) 	vucmprhb v14,v24,v22
.*:	(c3 a8 d8 11|11 d8 a8 c3) 	vucmprlb v14,v24,v21
.*:	(03 b1 f8 11|11 f8 b1 03) 	vucmprhh v15,v24,v22
.*:	(43 a9 f8 11|11 f8 a9 43) 	vucmprlh v15,v24,v21
.*:	(83 b1 a0 12|12 a0 b1 83) 	vupkhsntob v21,v22
.*:	(83 a9 81 12|12 81 a9 83) 	vupklsntob v20,v21
.*:	(83 91 2b 12|12 2b 91 83) 	vupkint4tobf16 v17,v18,3
.*:	(83 c9 e3 11|11 e3 c9 83) 	vupkint8tobf16 v15,v25,1
.*:	(83 c1 17 12|12 17 c1 83) 	vupkint4tofp32 v16,v24,7
.*:	(83 b9 2f 12|12 2f b9 83) 	vupkint8tofp32 v17,v23,3
.*:	(da 9e 72 7c|7c 72 9e da) 	lxvpb32x vs34,r18,r19
.*:	(da af 74 7c|7c 74 af da) 	stxvpb32x vs34,r20,r21
.*:	(4c 06 00 7c|7c 00 06 4c) 	ccmclean
.*:	(cc 06 00 7c|7c 00 06 cc) 	ccmrl
.*:	(26 22 40 7c|7c 40 22 26) 	mtlpl   r4,r2
.*:	(a6 bb 23 7c|7c 23 bb a6) 	mtummcrae r1
.*:	(a6 bb 45 7c|7c 45 bb a6) 	mtummcr2e r2
.*:	(a6 bb 65 7c|7c 65 bb a6) 	mtummcr2e r3
.*:	(a6 bb 93 7c|7c 93 bb a6) 	mtmmcrae r4
.*:	(a6 bb b4 7c|7c b4 bb a6) 	mtmmcr1e r5
.*:	(a6 bb d6 7c|7c d6 bb a6) 	mtmmcr3e r6
.*:	(a6 c3 e9 7c|7c e9 c3 a6) 	mtupmc7 r7
.*:	(a6 c3 0a 7d|7d 0a c3 a6) 	mtupmc8 r8
.*:	(a6 c3 39 7d|7d 39 c3 a6) 	mtpmc7  r9
.*:	(a6 c3 5a 7d|7d 5a c3 a6) 	mtpmc8  r10
.*:	(a6 ba 63 7d|7d 63 ba a6) 	mfummcrae r11
.*:	(a6 ba 83 7d|7d 83 ba a6) 	mfummcrae r12
.*:	(a6 ba a4 7d|7d a4 ba a6) 	mfummcr1e r13
.*:	(a6 ba c4 7d|7d c4 ba a6) 	mfummcr1e r14
.*:	(a6 ba e5 7d|7d e5 ba a6) 	mfummcr2e r15
.*:	(a6 ba 05 7e|7e 05 ba a6) 	mfummcr2e r16
.*:	(a6 ba 26 7e|7e 26 ba a6) 	mfummcr3e r17
.*:	(a6 ba 46 7e|7e 46 ba a6) 	mfummcr3e r18
.*:	(a6 c2 69 7e|7e 69 c2 a6) 	mfupmc7 r19
.*:	(a6 c2 89 7e|7e 89 c2 a6) 	mfupmc7 r20
.*:	(a6 c2 aa 7e|7e aa c2 a6) 	mfupmc8 r21
.*:	(a6 c2 ca 7e|7e ca c2 a6) 	mfupmc8 r22
.*:	(64 10 8f 7c|7c 8f 10 64) 	tlbiep  r2,r4,3,1,1
.*:	(64 10 60 7c|7c 60 10 64) 	tlbiep  r2,r3
.*:	(24 38 c8 7c|7c c8 38 24) 	tlbieio r7,r6,2
.*:	(68 04 20 7d|7d 20 04 68) 	tlbsyncio r9
.*:	(a8 04 a0 7c|7c a0 04 a8) 	ptesyncio r5
#pass
