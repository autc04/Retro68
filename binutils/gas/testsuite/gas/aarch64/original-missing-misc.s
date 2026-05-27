	addp	d0, v0.2d
	addp	d31, v0.2d
	addp	d0, v31.2d

	smulh	x0, x0, x0
	smulh	xzr, x0, x0
	smulh	x0, xzr, x0
	smulh	x0, x0, xzr

	umulh	x0, x0, x0
	umulh	xzr, x0, x0
	umulh	x0, xzr, x0
	umulh	x0, x0, xzr

	prfum	pldl1keep, [x0, #0]
	prfum	#31, [x0, #0]
	prfum	#0, [sp, #0]
	prfum	#0, [x0, #-1]
	prfum	plil1keep, [x0]
	prfum	pstl1keep, [x0]
	prfum	pldl2keep, [x0]
	prfum	pldl3keep, [x0]
	prfum	pldl1strm, [x0]
// Verify that we don't use the IR symbol in disassembly.
	prfum	#0x18, [x0, #0]

	eor	w0, w0, 0x1
	eor	wsp, w0, 0x1
	eor	w0, wzr, 0x1
	eor	w0, w0, 0x2
	eor	w0, w0, 0x3
	eor	w0, w0, 0x7fffffff
	eor	w0, w0, 0x55555555
	.inst	0x5233f000
	eor	x0, x0, 0x1
	eor	sp, x0, 0x1
	eor	x0, xzr, 0x1
	eor	x0, x0, 0x2
	eor	x0, x0, 0x3
	eor	x0, x0, 0x7fffffffffffffff
	eor	x0, x0, 0x5555555555555555
	.inst	0xd233f000
