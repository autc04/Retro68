	ccmn	w0, #0, #0, eq
	ccmn	wzr, #0, #0, eq
	ccmn	w0, #31, #0, eq
	ccmn	w0, #0, #15, eq
	ccmn	w0, #0, #0, nv

	ccmn	x0, #0, #0, eq
	ccmn	xzr, #0, #0, eq
	ccmn	x0, #31, #0, eq
	ccmn	x0, #0, #15, eq
	ccmn	x0, #0, #0, nv

	ccmp	w0, #0, #0, eq
	ccmp	wzr, #0, #0, eq
	ccmp	w0, #31, #0, eq
	ccmp	w0, #0, #15, eq
	ccmp	w0, #0, #0, nv

	ccmp	x0, #0, #0, eq
	ccmp	xzr, #0, #0, eq
	ccmp	x0, #31, #0, eq
	ccmp	x0, #0, #15, eq
	ccmp	x0, #0, #0, nv

	ccmn	w0, w0, #0, eq
	ccmn	wzr, w0, #0, eq
	ccmn	w0, wzr, #0, eq
	ccmn	w0, w0, #15, eq
	ccmn	w0, w0, #0, nv

	ccmn	x0, x0, #0, eq
	ccmn	xzr, x0, #0, eq
	ccmn	x0, xzr, #0, eq
	ccmn	x0, x0, #15, eq
	ccmn	x0, x0, #0, nv

	ccmp	w0, w0, #0, eq
	ccmp	wzr, w0, #0, eq
	ccmp	w0, wzr, #0, eq
	ccmp	w0, w0, #15, eq
	ccmp	w0, w0, #0, nv

	ccmp	x0, x0, #0, eq
	ccmp	xzr, x0, #0, eq
	ccmp	x0, xzr, #0, eq
	ccmp	x0, x0, #15, eq
	ccmp	x0, x0, #0, nv

	ccmn	w0, #0, #0, eq
	ccmn	w0, #0, #0, none
	ccmn	w0, #0, #0, ne
	ccmn	w0, #0, #0, any
	ccmn	w0, #0, #0, hs
	ccmn	w0, #0, #0, cs
	ccmn	w0, #0, #0, nlast
	ccmn	w0, #0, #0, lo
	ccmn	w0, #0, #0, cc
	ccmn	w0, #0, #0, last
	ccmn	w0, #0, #0, mi
	ccmn	w0, #0, #0, first
	ccmn	w0, #0, #0, pl
	ccmn	w0, #0, #0, nfrst
	ccmn	w0, #0, #0, vs
	ccmn	w0, #0, #0, vc
	ccmn	w0, #0, #0, hi
	ccmn	w0, #0, #0, pmore
	ccmn	w0, #0, #0, ls
	ccmn	w0, #0, #0, plast
	ccmn	w0, #0, #0, ge
	ccmn	w0, #0, #0, tcont
	ccmn	w0, #0, #0, lt
	ccmn	w0, #0, #0, tstop
	ccmn	w0, #0, #0, gt
	ccmn	w0, #0, #0, le
	ccmn	w0, #0, #0, al
	ccmn	w0, #0, #0, nv
