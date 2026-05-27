// movi and fmov are tested elsewhere, so skipped here.

	orr	v0.4h, #0
	orr	v31.4h, #0
	orr	v0.4h, #31
	orr	v0.4h, #255
	orr	v0.4h, #0, lsl #0
	orr	v0.4h, #0, lsl #8
	orr	v0.8h, #0
	orr	v31.8h, #0
	orr	v0.8h, #31
	orr	v0.8h, #255
	orr	v0.8h, #255, lsl #0
	orr	v0.8h, #255, lsl #8
	orr	v0.2s, #0
	orr	v31.2s, #0
	orr	v0.2s, #31
	orr	v0.2s, #255
	orr	v0.2s, #0, lsl #0
	orr	v0.2s, #0, lsl #8
	orr	v0.2s, #0, lsl #16
	orr	v0.2s, #0, lsl #24
	orr	v0.4s, #0
	orr	v31.4s, #0
	orr	v0.4s, #31
	orr	v0.4s, #255
	orr	v0.4s, #255, lsl #0
	orr	v0.4s, #255, lsl #8
	orr	v0.4s, #255, lsl #16
	orr	v0.4s, #255, lsl #24

	mvni	v0.4h, #0
	mvni	v31.4h, #0
	mvni	v0.4h, #31
	mvni	v0.4h, #255
	mvni	v0.4h, #0, lsl #0
	mvni	v0.4h, #0, lsl #8
	mvni	v0.8h, #0
	mvni	v31.8h, #0
	mvni	v0.8h, #31
	mvni	v0.8h, #255
	mvni	v0.8h, #255, lsl #0
	mvni	v0.8h, #255, lsl #8
	mvni	v0.2s, #0
	mvni	v31.2s, #0
	mvni	v0.2s, #31
	mvni	v0.2s, #255
	mvni	v0.2s, #0, lsl #0
	mvni	v0.2s, #0, lsl #8
	mvni	v0.2s, #0, lsl #16
	mvni	v0.2s, #0, lsl #24
	mvni	v0.4s, #0
	mvni	v31.4s, #0
	mvni	v0.4s, #31
	mvni	v0.4s, #255
	mvni	v0.4s, #255, lsl #0
	mvni	v0.4s, #255, lsl #8
	mvni	v0.4s, #255, lsl #16
	mvni	v0.4s, #255, lsl #24
	mvni	v0.2s, #0, msl #8
	mvni	v31.2s, #0, msl #8
	mvni	v0.2s, #31, msl #8
	mvni	v0.2s, #255, msl #8
	mvni	v0.2s, #0, msl #16
	mvni	v0.4s, #0, msl #8
	mvni	v31.4s, #0, msl #8
	mvni	v0.4s, #31, msl #8
	mvni	v0.4s, #255, msl #8
	mvni	v0.4s, #255, msl #16

	bic	v0.4h, #0
	bic	v31.4h, #0
	bic	v0.4h, #31
	bic	v0.4h, #255
	bic	v0.4h, #0, lsl #0
	bic	v0.4h, #0, lsl #8
	bic	v0.8h, #0
	bic	v31.8h, #0
	bic	v0.8h, #31
	bic	v0.8h, #255
	bic	v0.8h, #255, lsl #0
	bic	v0.8h, #255, lsl #8
	bic	v0.2s, #0
	bic	v31.2s, #0
	bic	v0.2s, #31
	bic	v0.2s, #255
	bic	v0.2s, #0, lsl #0
	bic	v0.2s, #0, lsl #8
	bic	v0.2s, #0, lsl #16
	bic	v0.2s, #0, lsl #24
	bic	v0.4s, #0
	bic	v31.4s, #0
	bic	v0.4s, #31
	bic	v0.4s, #255
	bic	v0.4s, #255, lsl #0
	bic	v0.4s, #255, lsl #8
	bic	v0.4s, #255, lsl #16
	bic	v0.4s, #255, lsl #24
