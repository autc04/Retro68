#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	3a400800 	ccmn	w0, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a400be0 	ccmn	wzr, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a5f0800 	ccmn	w0, #0x1f, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a40080f 	ccmn	w0, #0x0, #0xf, eq	// eq = none
 *[0-9a-f]+:	3a40f800 	ccmn	w0, #0x0, #0x0, nv
 *[0-9a-f]+:	ba400800 	ccmn	x0, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	ba400be0 	ccmn	xzr, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	ba5f0800 	ccmn	x0, #0x1f, #0x0, eq	// eq = none
 *[0-9a-f]+:	ba40080f 	ccmn	x0, #0x0, #0xf, eq	// eq = none
 *[0-9a-f]+:	ba40f800 	ccmn	x0, #0x0, #0x0, nv
 *[0-9a-f]+:	7a400800 	ccmp	w0, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	7a400be0 	ccmp	wzr, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	7a5f0800 	ccmp	w0, #0x1f, #0x0, eq	// eq = none
 *[0-9a-f]+:	7a40080f 	ccmp	w0, #0x0, #0xf, eq	// eq = none
 *[0-9a-f]+:	7a40f800 	ccmp	w0, #0x0, #0x0, nv
 *[0-9a-f]+:	fa400800 	ccmp	x0, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	fa400be0 	ccmp	xzr, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	fa5f0800 	ccmp	x0, #0x1f, #0x0, eq	// eq = none
 *[0-9a-f]+:	fa40080f 	ccmp	x0, #0x0, #0xf, eq	// eq = none
 *[0-9a-f]+:	fa40f800 	ccmp	x0, #0x0, #0x0, nv
 *[0-9a-f]+:	3a400000 	ccmn	w0, w0, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a4003e0 	ccmn	wzr, w0, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a5f0000 	ccmn	w0, wzr, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a40000f 	ccmn	w0, w0, #0xf, eq	// eq = none
 *[0-9a-f]+:	3a40f000 	ccmn	w0, w0, #0x0, nv
 *[0-9a-f]+:	ba400000 	ccmn	x0, x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	ba4003e0 	ccmn	xzr, x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	ba5f0000 	ccmn	x0, xzr, #0x0, eq	// eq = none
 *[0-9a-f]+:	ba40000f 	ccmn	x0, x0, #0xf, eq	// eq = none
 *[0-9a-f]+:	ba40f000 	ccmn	x0, x0, #0x0, nv
 *[0-9a-f]+:	7a400000 	ccmp	w0, w0, #0x0, eq	// eq = none
 *[0-9a-f]+:	7a4003e0 	ccmp	wzr, w0, #0x0, eq	// eq = none
 *[0-9a-f]+:	7a5f0000 	ccmp	w0, wzr, #0x0, eq	// eq = none
 *[0-9a-f]+:	7a40000f 	ccmp	w0, w0, #0xf, eq	// eq = none
 *[0-9a-f]+:	7a40f000 	ccmp	w0, w0, #0x0, nv
 *[0-9a-f]+:	fa400000 	ccmp	x0, x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	fa4003e0 	ccmp	xzr, x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	fa5f0000 	ccmp	x0, xzr, #0x0, eq	// eq = none
 *[0-9a-f]+:	fa40000f 	ccmp	x0, x0, #0xf, eq	// eq = none
 *[0-9a-f]+:	fa40f000 	ccmp	x0, x0, #0x0, nv
 *[0-9a-f]+:	3a400800 	ccmn	w0, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a400800 	ccmn	w0, #0x0, #0x0, eq	// eq = none
 *[0-9a-f]+:	3a401800 	ccmn	w0, #0x0, #0x0, ne	// ne = any
 *[0-9a-f]+:	3a401800 	ccmn	w0, #0x0, #0x0, ne	// ne = any
 *[0-9a-f]+:	3a402800 	ccmn	w0, #0x0, #0x0, cs	// cs = hs, nlast
 *[0-9a-f]+:	3a402800 	ccmn	w0, #0x0, #0x0, cs	// cs = hs, nlast
 *[0-9a-f]+:	3a402800 	ccmn	w0, #0x0, #0x0, cs	// cs = hs, nlast
 *[0-9a-f]+:	3a403800 	ccmn	w0, #0x0, #0x0, cc	// cc = lo, ul, last
 *[0-9a-f]+:	3a403800 	ccmn	w0, #0x0, #0x0, cc	// cc = lo, ul, last
 *[0-9a-f]+:	3a403800 	ccmn	w0, #0x0, #0x0, cc	// cc = lo, ul, last
 *[0-9a-f]+:	3a404800 	ccmn	w0, #0x0, #0x0, mi	// mi = first
 *[0-9a-f]+:	3a404800 	ccmn	w0, #0x0, #0x0, mi	// mi = first
 *[0-9a-f]+:	3a405800 	ccmn	w0, #0x0, #0x0, pl	// pl = nfrst
 *[0-9a-f]+:	3a405800 	ccmn	w0, #0x0, #0x0, pl	// pl = nfrst
 *[0-9a-f]+:	3a406800 	ccmn	w0, #0x0, #0x0, vs
 *[0-9a-f]+:	3a407800 	ccmn	w0, #0x0, #0x0, vc
 *[0-9a-f]+:	3a408800 	ccmn	w0, #0x0, #0x0, hi	// hi = pmore
 *[0-9a-f]+:	3a408800 	ccmn	w0, #0x0, #0x0, hi	// hi = pmore
 *[0-9a-f]+:	3a409800 	ccmn	w0, #0x0, #0x0, ls	// ls = plast
 *[0-9a-f]+:	3a409800 	ccmn	w0, #0x0, #0x0, ls	// ls = plast
 *[0-9a-f]+:	3a40a800 	ccmn	w0, #0x0, #0x0, ge	// ge = tcont
 *[0-9a-f]+:	3a40a800 	ccmn	w0, #0x0, #0x0, ge	// ge = tcont
 *[0-9a-f]+:	3a40b800 	ccmn	w0, #0x0, #0x0, lt	// lt = tstop
 *[0-9a-f]+:	3a40b800 	ccmn	w0, #0x0, #0x0, lt	// lt = tstop
 *[0-9a-f]+:	3a40c800 	ccmn	w0, #0x0, #0x0, gt
 *[0-9a-f]+:	3a40d800 	ccmn	w0, #0x0, #0x0, le
 *[0-9a-f]+:	3a40e800 	ccmn	w0, #0x0, #0x0, al
 *[0-9a-f]+:	3a40f800 	ccmn	w0, #0x0, #0x0, nv
