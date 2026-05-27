	.text
_start:
	subfus	10,0,12,11
	subwus	10,11,12
	subfus.	10,0,12,11
	subwus.	10,11,12
	subfus	20,1,22,21
	subdus	20,21,22
	subfus.	20,1,22,21
	subdus.	20,21,22
	lxvrl	 34,10,11
	lxvrll	 35,10,12
	lxvprl	 36,10,13
	lxvprll	 38,10,14
	stxvrl	 40,10,15
	stxvrll	 41,10,16
	stxvprl	 40,10,17
	stxvprll 42,10,18
	xvrlw	 31,41,51
	xvadduwm 30,42,52
	xvadduhm 30,42,53
	xvsubuwm 29,43,54
	xvsubuhm 63,0,30
	xvmuluwm 30,40,60
	xvmuluhm 60,61,62
	xvmulhsw 34,35,36
	xvmulhsh 1,2,3
	xvmulhuw 20,21,22
	xvmulhuh 20,42,52
	xxaesencp 2, 4, 6, 0
	xxaes128encp 2, 4, 6
	xxaesencp 2, 4, 36, 1
	xxaes192encp 2, 4, 36
	xxaesencp 32, 34, 36, 2
	xxaes256encp 32, 34, 36
	xxaesdecp 2, 4, 6, 0
	xxaes128decp 2, 4, 6
	xxaesdecp 2, 4, 36, 1
	xxaes192decp 2, 4, 36
	xxaesdecp 32, 34, 36, 2
	xxaes256decp 32, 34, 36
	xxaesgenlkp 16, 18, 0
	xxaes128genlkp 16, 18
	xxaesgenlkp 40, 50, 1
	xxaes192genlkp 40, 50
	xxaesgenlkp 20, 54, 2
	xxaes256genlkp 20, 54
	xxgfmul128 1, 2, 3, 0
	xxgfmul128gcm 1, 2, 3
	xxgfmul128 31, 32, 33, 1
	xxgfmul128xts 31, 32, 33
	paddis 12, 9, 15, 0
	paddis 12, 9, 15
	paddis 12, 9, ~(1<<15), 0
	paddis 12, 9, ~(1<<15)
	paddis 9, 0, 25, 1
	paddis 24, 0, 2147483647, 0
	paddis 24, 0, 2147483647
	plis 24, 2147483647
	paddis 30, 10, -2147483648, 0
	paddis 30, 10, -2147483648
	psubis 30, 10, 2147483648, 0
	nop
	paddis 30, 10, 2147483647, 0
	paddis 30, 10, 2147483647
	psubis 30, 10, -2147483647, 0
	paddis 15, 0, 2147483647, 1
	psubis 15, 0, -2147483647, 1
	vucmprhn 13, 24, 21
	vucmprln 13, 24, 22
	vucmprhb 14, 24, 22
	vucmprlb 14, 24, 21
	vucmprhh 15, 24, 22
	vucmprlh 15, 24, 21
	vupkhsntob 21, 22
	vupklsntob 20, 21
	vupkint4tobf16 17, 18, 3
	vupkint8tobf16 15, 25, 1
	vupkint4tofp32 16, 24, 7
	vupkint8tofp32 17, 23, 3
	lxvpb32x 34, 18, 19
	stxvpb32x 34, 20, 21
	ccmclean
	ccmrl
	mtlpl 4, 2
	mtummcrae 1
	mtummcr2e 2
	mtmmcr2e 3
	mtmmcrae 4
	mtmmcr1e 5
	mtmmcr3e 6
	mtupmc7 7
	mtupmc8 8
	mtpmc7 9
	mtpmc8 10
	mfummcrae 11
	mfmmcrae 12
	mfummcr1e 13
	mfmmcr1e 14
	mfummcr2e 15
	mfmmcr2e 16
	mfummcr3e 17
	mfmmcr3e 18
	mfupmc7 19
	mfpmc7 20
	mfupmc8 21
	mfpmc8 22
	tlbiep 2, 4, 3, 1, 1
	tlbiep 2, 3
	tlbieio 7, 6, 2
	tlbsyncio 9
	ptesyncio 5

