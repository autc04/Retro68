	xtn	v0.8b, v0.8h
	xtn	v31.8b, v0.8h
	xtn	v0.8b, v31.8h
	xtn	v0.4h, v0.4s
	xtn	v31.4h, v0.4s
	xtn	v0.4h, v31.4s
	xtn	v0.2s, v0.2d
	xtn	v31.2s, v0.2d
	xtn	v0.2s, v31.2d
	xtn2	v0.16b, v0.8h
	xtn2	v31.16b, v0.8h
	xtn2	v0.16b, v31.8h
	xtn2	v0.8h, v0.4s
	xtn2	v31.8h, v0.4s
	xtn2	v0.8h, v31.4s
	xtn2	v0.4s, v0.2d
	xtn2	v31.4s, v0.2d
	xtn2	v0.4s, v31.2d

	sqxtn	v0.8b, v0.8h
	sqxtn	v31.8b, v0.8h
	sqxtn	v0.8b, v31.8h
	sqxtn	v0.4h, v0.4s
	sqxtn	v31.4h, v0.4s
	sqxtn	v0.4h, v31.4s
	sqxtn	v0.2s, v0.2d
	sqxtn	v31.2s, v0.2d
	sqxtn	v0.2s, v31.2d
	sqxtn2	v0.16b, v0.8h
	sqxtn2	v31.16b, v0.8h
	sqxtn2	v0.16b, v31.8h
	sqxtn2	v0.8h, v0.4s
	sqxtn2	v31.8h, v0.4s
	sqxtn2	v0.8h, v31.4s
	sqxtn2	v0.4s, v0.2d
	sqxtn2	v31.4s, v0.2d
	sqxtn2	v0.4s, v31.2d

	fcvtn	v0.4h, v0.4s
	fcvtn	v31.4h, v0.4s
	fcvtn	v0.4h, v31.4s
	fcvtn	v0.2s, v0.2d
	fcvtn	v31.2s, v0.2d
	fcvtn	v0.2s, v31.2d
	fcvtn2	v0.8h, v0.4s
	fcvtn2	v31.8h, v0.4s
	fcvtn2	v0.8h, v31.4s
	fcvtn2	v0.4s, v0.2d
	fcvtn2	v31.4s, v0.2d
	fcvtn2	v0.4s, v31.2d

	fcvtl	v0.4s, v0.4h
	fcvtl	v31.4s, v0.4h
	fcvtl	v0.4s, v31.4h
	fcvtl	v0.2d, v0.2s
	fcvtl	v31.2d, v0.2s
	fcvtl	v0.2d, v31.2s
	fcvtl2	v0.4s, v0.8h
	fcvtl2	v31.4s, v0.8h
	fcvtl2	v0.4s, v31.8h
	fcvtl2	v0.2d, v0.4s
	fcvtl2	v31.2d, v0.4s
	fcvtl2	v0.2d, v31.4s

	sqxtun	v0.8b, v0.8h
	sqxtun	v31.8b, v0.8h
	sqxtun	v0.8b, v31.8h
	sqxtun	v0.4h, v0.4s
	sqxtun	v31.4h, v0.4s
	sqxtun	v0.4h, v31.4s
	sqxtun	v0.2s, v0.2d
	sqxtun	v31.2s, v0.2d
	sqxtun	v0.2s, v31.2d
	sqxtun2	v0.16b, v0.8h
	sqxtun2	v31.16b, v0.8h
	sqxtun2	v0.16b, v31.8h
	sqxtun2	v0.8h, v0.4s
	sqxtun2	v31.8h, v0.4s
	sqxtun2	v0.8h, v31.4s
	sqxtun2	v0.4s, v0.2d
	sqxtun2	v31.4s, v0.2d
	sqxtun2	v0.4s, v31.2d

	shll	v0.8h, v0.8b, #8
	shll	v31.8h, v0.8b, #8
	shll	v0.8h, v31.8b, #8
	shll	v0.4s, v0.4h, #16
	shll	v31.4s, v0.4h, #16
	shll	v0.4s, v31.4h, #16
	shll	v0.2d, v0.2s, #32
	shll	v31.2d, v0.2s, #32
	shll	v0.2d, v31.2s, #32
	shll2	v0.8h, v0.16b, #8
	shll2	v31.8h, v0.16b, #8
	shll2	v0.8h, v31.16b, #8
	shll2	v0.4s, v0.8h, #16
	shll2	v31.4s, v0.8h, #16
	shll2	v0.4s, v31.8h, #16
	shll2	v0.2d, v0.4s, #32
	shll2	v31.2d, v0.4s, #32
	shll2	v0.2d, v31.4s, #32

	uqxtn	v0.8b, v0.8h
	uqxtn	v31.8b, v0.8h
	uqxtn	v0.8b, v31.8h
	uqxtn	v0.4h, v0.4s
	uqxtn	v31.4h, v0.4s
	uqxtn	v0.4h, v31.4s
	uqxtn	v0.2s, v0.2d
	uqxtn	v31.2s, v0.2d
	uqxtn	v0.2s, v31.2d
	uqxtn2	v0.16b, v0.8h
	uqxtn2	v31.16b, v0.8h
	uqxtn2	v0.16b, v31.8h
	uqxtn2	v0.8h, v0.4s
	uqxtn2	v31.8h, v0.4s
	uqxtn2	v0.8h, v31.4s
	uqxtn2	v0.4s, v0.2d
	uqxtn2	v31.4s, v0.2d
	uqxtn2	v0.4s, v31.2d

	fcvtxn	v0.2s, v0.2d
	fcvtxn	v31.2s, v0.2d
	fcvtxn	v0.2s, v31.2d
	fcvtxn2	v0.4s, v0.2d
	fcvtxn2	v31.4s, v0.2d
	fcvtxn2	v0.4s, v31.2d
