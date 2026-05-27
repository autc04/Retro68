#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	5ef1b800 	addp	d0, v0\.2d
 *[0-9a-f]+:	5ef1b81f 	addp	d31, v0\.2d
 *[0-9a-f]+:	5ef1bbe0 	addp	d0, v31\.2d
 *[0-9a-f]+:	9b407c00 	smulh	x0, x0, x0
 *[0-9a-f]+:	9b407c1f 	smulh	xzr, x0, x0
 *[0-9a-f]+:	9b407fe0 	smulh	x0, xzr, x0
 *[0-9a-f]+:	9b5f7c00 	smulh	x0, x0, xzr
 *[0-9a-f]+:	9bc07c00 	umulh	x0, x0, x0
 *[0-9a-f]+:	9bc07c1f 	umulh	xzr, x0, x0
 *[0-9a-f]+:	9bc07fe0 	umulh	x0, xzr, x0
 *[0-9a-f]+:	9bdf7c00 	umulh	x0, x0, xzr
 *[0-9a-f]+:	f8800000 	prfum	pldl1keep, \[x0\]
 *[0-9a-f]+:	f880001f 	prfum	#0x1f, \[x0\]
 *[0-9a-f]+:	f88003e0 	prfum	pldl1keep, \[sp\]
 *[0-9a-f]+:	f89ff000 	prfum	pldl1keep, \[x0, #-1\]
 *[0-9a-f]+:	f8800008 	prfum	plil1keep, \[x0\]
 *[0-9a-f]+:	f8800010 	prfum	pstl1keep, \[x0\]
 *[0-9a-f]+:	f8800002 	prfum	pldl2keep, \[x0\]
 *[0-9a-f]+:	f8800004 	prfum	pldl3keep, \[x0\]
 *[0-9a-f]+:	f8800001 	prfum	pldl1strm, \[x0\]
 *[0-9a-f]+:	f8800018 	prfum	#0x18, \[x0\]
 *[0-9a-f]+:	52000000 	eor	w0, w0, #0x1
 *[0-9a-f]+:	5200001f 	eor	wsp, w0, #0x1
 *[0-9a-f]+:	520003e0 	eor	w0, wzr, #0x1
 *[0-9a-f]+:	521f0000 	eor	w0, w0, #0x2
 *[0-9a-f]+:	52000400 	eor	w0, w0, #0x3
 *[0-9a-f]+:	52007800 	eor	w0, w0, #0x7fffffff
 *[0-9a-f]+:	5200f000 	eor	w0, w0, #0x55555555
 *[0-9a-f]+:	5233f000 	eor	w0, w0, #0xaaaaaaaa
 *[0-9a-f]+:	d2400000 	eor	x0, x0, #0x1
 *[0-9a-f]+:	d240001f 	eor	sp, x0, #0x1
 *[0-9a-f]+:	d24003e0 	eor	x0, xzr, #0x1
 *[0-9a-f]+:	d27f0000 	eor	x0, x0, #0x2
 *[0-9a-f]+:	d2400400 	eor	x0, x0, #0x3
 *[0-9a-f]+:	d240f800 	eor	x0, x0, #0x7fffffffffffffff
 *[0-9a-f]+:	d200f000 	eor	x0, x0, #0x5555555555555555
 *[0-9a-f]+:	d233f000 	eor	x0, x0, #0xaaaaaaaaaaaaaaaa
