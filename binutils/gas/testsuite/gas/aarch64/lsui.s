ldtxr:
	ldtxr	w0, [x0]
	ldtxr	w0, [sp]
	ldtxr	wzr, [x0]
	ldtxr	x0, [x0]
	ldtxr	x0, [sp]
	ldtxr	xzr, [x0]

ldatxr:
	ldatxr	w0, [x0]
	ldatxr	w0, [sp]
	ldatxr	wzr, [x0]
	ldatxr	x0, [x0]
	ldatxr	x0, [sp]
	ldatxr	xzr, [x0]

sttxr:
	sttxr	w0, w4, [x2]
	sttxr	w0, w4, [sp]
	sttxr	w0, wzr, [x2]
	sttxr	w0, wzr, [sp]
	sttxr	w29, w4, [x0]
	sttxr	w29, w4, [sp]
	sttxr	w29, wzr, [x0]
	sttxr	w29, wzr, [sp]
	sttxr	w0, x4, [x2]
	sttxr	w0, x4, [sp]
	sttxr	w0, xzr, [x2]
	sttxr	w0, xzr, [sp]
	sttxr	w29, x4, [x0]
	sttxr	w29, x4, [sp]
	sttxr	w29, xzr, [x0]
	sttxr	w29, xzr, [sp]

stltxr:
	stltxr	w0, w4, [x2]
	stltxr	w0, w4, [sp]
	stltxr	w0, wzr, [x2]
	stltxr	w0, wzr, [sp]
	stltxr	w29, w4, [x0]
	stltxr	w29, w4, [sp]
	stltxr	w29, wzr, [x0]
	stltxr	w29, wzr, [sp]
	stltxr	w0, x4, [x2]
	stltxr	w0, x4, [sp]
	stltxr	w0, xzr, [x2]
	stltxr	w0, xzr, [sp]
	stltxr	w29, x4, [x0]
	stltxr	w29, x4, [sp]
	stltxr	w29, xzr, [x0]
	stltxr	w29, xzr, [sp]

cast:
	cast	x0, x0, [x0]
	cast	x0, x0, [sp]
	cast	x0, xzr, [x0]
	cast	x0, xzr, [sp]
	cast	xzr, x0, [x0]
	cast	xzr, x0, [sp]
	cast	xzr, xzr, [x0]
	cast	xzr, xzr, [sp]

casat:
	casat	x0, x0, [x0]
	casat	x0, x0, [sp]
	casat	x0, xzr, [x0]
	casat	x0, xzr, [sp]
	casat	xzr, x0, [x0]
	casat	xzr, x0, [sp]
	casat	xzr, xzr, [x0]
	casat	xzr, xzr, [sp]

casalt:
	casalt	x0, x0, [x0]
	casalt	x0, x0, [sp]
	casalt	x0, xzr, [x0]
	casalt	x0, xzr, [sp]
	casalt	xzr, x0, [x0]
	casalt	xzr, x0, [sp]
	casalt	xzr, xzr, [x0]
	casalt	xzr, xzr, [sp]

caslt:
	caslt	x0, x0, [x0]
	caslt	x0, x0, [sp]
	caslt	x0, xzr, [x0]
	caslt	x0, xzr, [sp]
	caslt	xzr, x0, [x0]
	caslt	xzr, x0, [sp]
	caslt	xzr, xzr, [x0]
	caslt	xzr, xzr, [sp]

caspt:
	caspt	x0, x1, x0, x1, [x0]
	caspt	x0, x1, x0, x1, [sp]
	caspt	x0, x1, x28, x29, [x0]
	caspt	x0, x1, x28, x29, [sp]
	caspt	x28, x29, x0, x1, [x0]
	caspt	x28, x29, x0, x1, [sp]
	caspt	x28, x29, x28, x29, [x0]
	caspt	x28, x29, x28, x29, [sp]

caspat:
	caspat	x0, x1, x0, x1, [x0]
	caspat	x0, x1, x0, x1, [sp]
	caspat	x0, x1, x28, x29, [x0]
	caspat	x0, x1, x28, x29, [sp]
	caspat	x28, x29, x0, x1, [x0]
	caspat	x28, x29, x0, x1, [sp]
	caspat	x28, x29, x28, x29, [x0]
	caspat	x28, x29, x28, x29, [sp]

caspalt:
	caspalt	x0, x1, x0, x1, [x0]
	caspalt	x0, x1, x0, x1, [sp]
	caspalt	x0, x1, x28, x29, [x0]
	caspalt	x0, x1, x28, x29, [sp]
	caspalt	x28, x29, x0, x1, [x0]
	caspalt	x28, x29, x0, x1, [sp]
	caspalt	x28, x29, x28, x29, [x0]
	caspalt	x28, x29, x28, x29, [sp]

casplt:
	casplt	x0, x1, x0, x1, [x0]
	casplt	x0, x1, x0, x1, [sp]
	casplt	x0, x1, x28, x29, [x0]
	casplt	x0, x1, x28, x29, [sp]
	casplt	x28, x29, x0, x1, [x0]
	casplt	x28, x29, x0, x1, [sp]
	casplt	x28, x29, x28, x29, [x0]
	casplt	x28, x29, x28, x29, [sp]

ldtp:
	ldtp	x0, x2, [x0]
	ldtp	x0, x2, [x0, #-8]
	ldtp	x0, x2, [sp]
	ldtp	x0, x2, [sp, #-8]
	ldtp	x0, xzr, [x0]
	ldtp	x0, xzr, [x0, #-8]
	ldtp	x0, xzr, [sp]
	ldtp	x0, xzr, [sp, #-8]
	ldtp	xzr, x2, [x0]
	ldtp	xzr, x2, [x0, #-8]
	ldtp	xzr, x2, [sp]
	ldtp	xzr, x2, [sp, #-8]
	ldtp	xzr, x29, [x0]
	ldtp	xzr, x29, [x0, #-8]
	ldtp	xzr, x29, [sp]
	ldtp	xzr, x29, [sp, #-8]

	ldtp	x0, x4, [x2, #16]!
	ldtp	x0, x4, [x2, #-8]!
	ldtp	x0, x4, [sp, #16]!
	ldtp	x0, x4, [sp, #-8]!
	ldtp	x0, xzr, [x2, #16]!
	ldtp	x0, xzr, [x2, #-8]!
	ldtp	x0, xzr, [sp, #16]!
	ldtp	x0, xzr, [sp, #-8]!
	ldtp	xzr, x0, [x2, #16]!
	ldtp	xzr, x0, [x2, #-8]!
	ldtp	xzr, x0, [sp, #16]!
	ldtp	xzr, x0, [sp, #-8]!
	ldtp	xzr, x29, [x2, #16]!
	ldtp	xzr, x29, [x2, #-8]!
	ldtp	xzr, x29, [sp, #16]!
	ldtp	xzr, x29, [sp, #-8]!

	ldtp	x0, x4, [x2], #16
	ldtp	x0, x4, [x2], #-8
	ldtp	x0, x4, [sp], #16
	ldtp	x0, x4, [sp], #-8
	ldtp	x0, xzr, [x2], #16
	ldtp	x0, xzr, [x2], #-8
	ldtp	x0, xzr, [sp], #16
	ldtp	x0, xzr, [sp], #-8
	ldtp	xzr, x0, [x2], #16
	ldtp	xzr, x0, [x2], #-8
	ldtp	xzr, x0, [sp], #16
	ldtp	xzr, x0, [sp], #-8
	ldtp	xzr, x29, [x2], #16
	ldtp	xzr, x29, [x2], #-8
	ldtp	xzr, x29, [sp], #16
	ldtp	xzr, x29, [sp], #-8

	ldtp	q0, q2, [x0]
	ldtp	q0, q2, [x0, #-16]
	ldtp	q0, q2, [sp]
	ldtp	q0, q2, [sp, #-16]
	ldtp	q0, q31, [x0]
	ldtp	q0, q31, [x0, #-16]
	ldtp	q0, q31, [sp]
	ldtp	q0, q31, [sp, #-16]
	ldtp	q31, q0, [x0]
	ldtp	q31, q0, [x0, #-16]
	ldtp	q31, q0, [sp]
	ldtp	q31, q0, [sp, #-16]
	ldtp	q31, q29, [x0]
	ldtp	q31, q29, [x0, #-16]
	ldtp	q31, q29, [sp]
	ldtp	q31, q29, [sp, #-16]

	ldtp	q0, q2, [x0, #32]!
	ldtp	q0, q2, [x0, #-16]!
	ldtp	q0, q2, [sp, #32]!
	ldtp	q0, q2, [sp, #-16]!
	ldtp	q0, q31, [x0, #32]!
	ldtp	q0, q31, [x0, #-16]!
	ldtp	q0, q31, [sp, #32]!
	ldtp	q0, q31, [sp, #-16]!
	ldtp	q31, q2, [x0, #32]!
	ldtp	q31, q2, [x0, #-16]!
	ldtp	q31, q2, [sp, #32]!
	ldtp	q31, q2, [sp, #-16]!
	ldtp	q31, q29, [x0, #32]!
	ldtp	q31, q29, [x0, #-16]!
	ldtp	q31, q29, [sp, #32]!
	ldtp	q31, q29, [sp, #-16]!

	ldtp	q0, q2, [x0], #32
	ldtp	q0, q2, [x0], #-16
	ldtp	q0, q2, [sp], #32
	ldtp	q0, q2, [sp], #-16
	ldtp	q0, q31, [x0], #32
	ldtp	q0, q31, [x0], #-16
	ldtp	q0, q31, [sp], #32
	ldtp	q0, q31, [sp], #-16
	ldtp	q31, q2, [x0], #32
	ldtp	q31, q2, [x0], #-16
	ldtp	q31, q2, [sp], #32
	ldtp	q31, q2, [sp], #-16
	ldtp	q31, q29, [x0], #32
	ldtp	q31, q29, [x0], #-16
	ldtp	q31, q29, [sp], #32
	ldtp	q31, q29, [sp], #-16

sttp:
	sttp	x0, x2, [x0]
	sttp	x0, x2, [x0, #-8]
	sttp	x0, x2, [sp]
	sttp	x0, x2, [sp, #-8]
	sttp	x0, xzr, [x0]
	sttp	x0, xzr, [x0, #-8]
	sttp	x0, xzr, [sp]
	sttp	x0, xzr, [sp, #-8]
	sttp	xzr, x2, [x0]
	sttp	xzr, x2, [x0, #-8]
	sttp	xzr, x2, [sp]
	sttp	xzr, x2, [sp, #-8]
	sttp	xzr, x29, [x0]
	sttp	xzr, x29, [x0, #-8]
	sttp	xzr, x29, [sp]
	sttp	xzr, x29, [sp, #-8]

	sttp	x0, x4, [x2, #16]!
	sttp	x0, x4, [x2, #-8]!
	sttp	x0, x4, [sp, #16]!
	sttp	x0, x4, [sp, #-8]!
	sttp	x0, xzr, [x2, #16]!
	sttp	x0, xzr, [x2, #-8]!
	sttp	x0, xzr, [sp, #16]!
	sttp	x0, xzr, [sp, #-8]!
	sttp	xzr, x0, [x2, #16]!
	sttp	xzr, x0, [x2, #-8]!
	sttp	xzr, x0, [sp, #16]!
	sttp	xzr, x0, [sp, #-8]!
	sttp	xzr, x29, [x2, #16]!
	sttp	xzr, x29, [x2, #-8]!
	sttp	xzr, x29, [sp, #16]!
	sttp	xzr, x29, [sp, #-8]!

	sttp	x0, x4, [x2], #16
	sttp	x0, x4, [x2], #-8
	sttp	x0, x4, [sp], #16
	sttp	x0, x4, [sp], #-8
	sttp	x0, xzr, [x2], #16
	sttp	x0, xzr, [x2], #-8
	sttp	x0, xzr, [sp], #16
	sttp	x0, xzr, [sp], #-8
	sttp	xzr, x0, [x2], #16
	sttp	xzr, x0, [x2], #-8
	sttp	xzr, x0, [sp], #16
	sttp	xzr, x0, [sp], #-8
	sttp	xzr, x29, [x2], #16
	sttp	xzr, x29, [x2], #-8
	sttp	xzr, x29, [sp], #16
	sttp	xzr, x29, [sp], #-8

	sttp	q0, q2, [x0]
	sttp	q0, q2, [x0, #-16]
	sttp	q0, q2, [sp]
	sttp	q0, q2, [sp, #-16]
	sttp	q0, q31, [x0]
	sttp	q0, q31, [x0, #-16]
	sttp	q0, q31, [sp]
	sttp	q0, q31, [sp, #-16]
	sttp	q31, q0, [x0]
	sttp	q31, q0, [x0, #-16]
	sttp	q31, q0, [sp]
	sttp	q31, q0, [sp, #-16]
	sttp	q31, q29, [x0]
	sttp	q31, q29, [x0, #-16]
	sttp	q31, q29, [sp]
	sttp	q31, q29, [sp, #-16]

	sttp	q0, q2, [x0, #32]!
	sttp	q0, q2, [x0, #-16]!
	sttp	q0, q2, [sp, #32]!
	sttp	q0, q2, [sp, #-16]!
	sttp	q0, q31, [x0, #32]!
	sttp	q0, q31, [x0, #-16]!
	sttp	q0, q31, [sp, #32]!
	sttp	q0, q31, [sp, #-16]!
	sttp	q31, q2, [x0, #32]!
	sttp	q31, q2, [x0, #-16]!
	sttp	q31, q2, [sp, #32]!
	sttp	q31, q2, [sp, #-16]!
	sttp	q31, q29, [x0, #32]!
	sttp	q31, q29, [x0, #-16]!
	sttp	q31, q29, [sp, #32]!
	sttp	q31, q29, [sp, #-16]!

	sttp	q0, q2, [x0], #32
	sttp	q0, q2, [x0], #-16
	sttp	q0, q2, [sp], #32
	sttp	q0, q2, [sp], #-16
	sttp	q0, q31, [x0], #32
	sttp	q0, q31, [x0], #-16
	sttp	q0, q31, [sp], #32
	sttp	q0, q31, [sp], #-16
	sttp	q31, q2, [x0], #32
	sttp	q31, q2, [x0], #-16
	sttp	q31, q2, [sp], #32
	sttp	q31, q2, [sp], #-16
	sttp	q31, q29, [x0], #32
	sttp	q31, q29, [x0], #-16
	sttp	q31, q29, [sp], #32
	sttp	q31, q29, [sp], #-16

swpt:
	swpt	w0, w0, [x0]
	swpt	w0, w0, [sp]
	swpt	w0, wzr, [x0]
	swpt	w0, wzr, [sp]
	swpt	wzr, w0, [x0]
	swpt	wzr, w0, [sp]
	swpt	wzr, wzr, [x0]
	swpt	wzr, wzr, [sp]
	swpt	x0, x0, [x0]
	swpt	x0, x0, [sp]
	swpt	x0, xzr, [x0]
	swpt	x0, xzr, [sp]
	swpt	xzr, x0, [x0]
	swpt	xzr, x0, [sp]
	swpt	xzr, xzr, [x0]
	swpt	xzr, xzr, [sp]

swpta:
	swpta	w0, w0, [x0]
	swpta	w0, w0, [sp]
	swpta	w0, wzr, [x0]
	swpta	w0, wzr, [sp]
	swpta	wzr, w0, [x0]
	swpta	wzr, w0, [sp]
	swpta	wzr, wzr, [x0]
	swpta	wzr, wzr, [sp]
	swpta	x0, x0, [x0]
	swpta	x0, x0, [sp]
	swpta	x0, xzr, [x0]
	swpta	x0, xzr, [sp]
	swpta	xzr, x0, [x0]
	swpta	xzr, x0, [sp]
	swpta	xzr, xzr, [x0]
	swpta	xzr, xzr, [sp]

swptal:
	swptal	w0, w0, [x0]
	swptal	w0, w0, [sp]
	swptal	w0, wzr, [x0]
	swptal	w0, wzr, [sp]
	swptal	wzr, w0, [x0]
	swptal	wzr, w0, [sp]
	swptal	wzr, wzr, [x0]
	swptal	wzr, wzr, [sp]
	swptal	x0, x0, [x0]
	swptal	x0, x0, [sp]
	swptal	x0, xzr, [x0]
	swptal	x0, xzr, [sp]
	swptal	xzr, x0, [x0]
	swptal	xzr, x0, [sp]
	swptal	xzr, xzr, [x0]
	swptal	xzr, xzr, [sp]

swptl:
	swptl	w0, w0, [x0]
	swptl	w0, w0, [sp]
	swptl	w0, wzr, [x0]
	swptl	w0, wzr, [sp]
	swptl	wzr, w0, [x0]
	swptl	wzr, w0, [sp]
	swptl	wzr, wzr, [x0]
	swptl	wzr, wzr, [sp]
	swptl	x0, x0, [x0]
	swptl	x0, x0, [sp]
	swptl	x0, xzr, [x0]
	swptl	x0, xzr, [sp]
	swptl	xzr, x0, [x0]
	swptl	xzr, x0, [sp]
	swptl	xzr, xzr, [x0]
	swptl	xzr, xzr, [sp]

ldtadd:
	ldtadd	w0, w0, [x0]
	ldtadd	w0, w0, [sp]
	ldtadd	w0, wzr, [x0]
	ldtadd	w0, wzr, [sp]
	ldtadd	wzr, w0, [x0]
	ldtadd	wzr, w0, [sp]
	ldtadd	wzr, wzr, [x0]
	ldtadd	wzr, wzr, [sp]
	ldtadd	w0, w29, [x0]
	ldtadd	w0, w29, [sp]
	ldtadd	wzr, w29, [x0]
	ldtadd	wzr, w29, [sp]
	ldtadd	x0, x0, [x0]
	ldtadd	x0, x0, [sp]
	ldtadd	x0, xzr, [x0]
	ldtadd	x0, xzr, [sp]
	ldtadd	xzr, x0, [x0]
	ldtadd	xzr, x0, [sp]
	ldtadd	xzr, xzr, [x0]
	ldtadd	xzr, xzr, [sp]
	ldtadd	x0, x29, [x0]
	ldtadd	x0, x29, [sp]
	ldtadd	xzr, x29, [x0]
	ldtadd	xzr, x29, [sp]

sttadd:
	sttadd	w0, [x0]
	sttadd	w0, [sp]
	sttadd	wzr, [x0]
	sttadd	wzr, [sp]
	sttadd	x0, [x0]
	sttadd	x0, [sp]
	sttadd	xzr, [x0]
	sttadd	xzr, [sp]

ldtadda:
	ldtadda	w0, w0, [x0]
	ldtadda	w0, w0, [sp]
	ldtadda	w0, wzr, [x0]
	ldtadda	w0, wzr, [sp]
	ldtadda	wzr, w0, [x0]
	ldtadda	wzr, w0, [sp]
	ldtadda	wzr, wzr, [x0]
	ldtadda	wzr, wzr, [sp]
	ldtadda	x0, x0, [x0]
	ldtadda	x0, x0, [sp]
	ldtadda	x0, xzr, [x0]
	ldtadda	x0, xzr, [sp]
	ldtadda	xzr, x0, [x0]
	ldtadda	xzr, x0, [sp]
	ldtadda	xzr, xzr, [x0]
	ldtadda	xzr, xzr, [sp]

ldtaddal:
	ldtaddal	w0, w0, [x0]
	ldtaddal	w0, w0, [sp]
	ldtaddal	w0, wzr, [x0]
	ldtaddal	w0, wzr, [sp]
	ldtaddal	wzr, w0, [x0]
	ldtaddal	wzr, w0, [sp]
	ldtaddal	wzr, wzr, [x0]
	ldtaddal	wzr, wzr, [sp]
	ldtaddal	x0, x0, [x0]
	ldtaddal	x0, x0, [sp]
	ldtaddal	x0, xzr, [x0]
	ldtaddal	x0, xzr, [sp]
	ldtaddal	xzr, x0, [x0]
	ldtaddal	xzr, x0, [sp]
	ldtaddal	xzr, xzr, [x0]
	ldtaddal	xzr, xzr, [sp]

ldtaddl:
	ldtaddl	w0, w0, [x0]
	ldtaddl	w0, w0, [sp]
	ldtaddl	w0, wzr, [x0]
	ldtaddl	w0, wzr, [sp]
	ldtaddl	wzr, w0, [x0]
	ldtaddl	wzr, w0, [sp]
	ldtaddl	wzr, wzr, [x0]
	ldtaddl	wzr, wzr, [sp]
	ldtaddl	w0, w29, [x0]
	ldtaddl	w0, w29, [sp]
	ldtaddl	wzr, w29, [x0]
	ldtaddl	wzr, w29, [sp]
	ldtaddl	x0, x0, [x0]
	ldtaddl	x0, x0, [sp]
	ldtaddl	x0, xzr, [x0]
	ldtaddl	x0, xzr, [sp]
	ldtaddl	xzr, x0, [x0]
	ldtaddl	xzr, x0, [sp]
	ldtaddl	xzr, xzr, [x0]
	ldtaddl	xzr, xzr, [sp]
	ldtaddl	x0, x29, [x0]
	ldtaddl	x0, x29, [sp]
	ldtaddl	xzr, x29, [x0]
	ldtaddl	xzr, x29, [sp]

sttaddl:
	sttaddl	w0, [x0]
	sttaddl	w0, [sp]
	sttaddl	wzr, [x0]
	sttaddl	wzr, [sp]
	sttaddl	x0, [x0]
	sttaddl	x0, [sp]
	sttaddl	xzr, [x0]
	sttaddl	xzr, [sp]

ldtclr:
	ldtclr	w0, w0, [x0]
	ldtclr	w0, w0, [sp]
	ldtclr	w0, wzr, [x0]
	ldtclr	w0, wzr, [sp]
	ldtclr	wzr, w0, [x0]
	ldtclr	wzr, w0, [sp]
	ldtclr	wzr, wzr, [x0]
	ldtclr	wzr, wzr, [sp]
	ldtclr	w0, w29, [x0]
	ldtclr	w0, w29, [sp]
	ldtclr	wzr, w29, [x0]
	ldtclr	wzr, w29, [sp]
	ldtclr	x0, x0, [x0]
	ldtclr	x0, x0, [sp]
	ldtclr	x0, xzr, [x0]
	ldtclr	x0, xzr, [sp]
	ldtclr	xzr, x0, [x0]
	ldtclr	xzr, x0, [sp]
	ldtclr	xzr, xzr, [x0]
	ldtclr	xzr, xzr, [sp]
	ldtclr	x0, x29, [x0]
	ldtclr	x0, x29, [sp]
	ldtclr	xzr, x29, [x0]
	ldtclr	xzr, x29, [sp]

sttclr:
	sttclr	w0, [x0]
	sttclr	w0, [sp]
	sttclr	wzr, [x0]
	sttclr	wzr, [sp]
	sttclr	x0, [x0]
	sttclr	x0, [sp]
	sttclr	xzr, [x0]
	sttclr	xzr, [sp]

ldtclra:
	ldtclra	w0, w0, [x0]
	ldtclra	w0, w0, [sp]
	ldtclra	w0, wzr, [x0]
	ldtclra	w0, wzr, [sp]
	ldtclra	wzr, w0, [x0]
	ldtclra	wzr, w0, [sp]
	ldtclra	wzr, wzr, [x0]
	ldtclra	wzr, wzr, [sp]
	ldtclra	x0, x0, [x0]
	ldtclra	x0, x0, [sp]
	ldtclra	x0, xzr, [x0]
	ldtclra	x0, xzr, [sp]
	ldtclra	xzr, x0, [x0]
	ldtclra	xzr, x0, [sp]
	ldtclra	xzr, xzr, [x0]
	ldtclra	xzr, xzr, [sp]

ldtclral:
	ldtclral	w0, w0, [x0]
	ldtclral	w0, w0, [sp]
	ldtclral	w0, wzr, [x0]
	ldtclral	w0, wzr, [sp]
	ldtclral	wzr, w0, [x0]
	ldtclral	wzr, w0, [sp]
	ldtclral	wzr, wzr, [x0]
	ldtclral	wzr, wzr, [sp]
	ldtclral	x0, x0, [x0]
	ldtclral	x0, x0, [sp]
	ldtclral	x0, xzr, [x0]
	ldtclral	x0, xzr, [sp]
	ldtclral	xzr, x0, [x0]
	ldtclral	xzr, x0, [sp]
	ldtclral	xzr, xzr, [x0]
	ldtclral	xzr, xzr, [sp]

ldtclrl:
	ldtclrl	w0, w0, [x0]
	ldtclrl	w0, w0, [sp]
	ldtclrl	w0, wzr, [x0]
	ldtclrl	w0, wzr, [sp]
	ldtclrl	wzr, w0, [x0]
	ldtclrl	wzr, w0, [sp]
	ldtclrl	wzr, wzr, [x0]
	ldtclrl	wzr, wzr, [sp]
	ldtclrl	w0, w29, [x0]
	ldtclrl	w0, w29, [sp]
	ldtclrl	wzr, w29, [x0]
	ldtclrl	wzr, w29, [sp]
	ldtclrl	x0, x0, [x0]
	ldtclrl	x0, x0, [sp]
	ldtclrl	x0, xzr, [x0]
	ldtclrl	x0, xzr, [sp]
	ldtclrl	xzr, x0, [x0]
	ldtclrl	xzr, x0, [sp]
	ldtclrl	xzr, xzr, [x0]
	ldtclrl	xzr, xzr, [sp]
	ldtclrl	x0, x29, [x0]
	ldtclrl	x0, x29, [sp]
	ldtclrl	xzr, x29, [x0]
	ldtclrl	xzr, x29, [sp]

sttclrl:
	sttclrl	w0, [x0]
	sttclrl	w0, [sp]
	sttclrl	wzr, [x0]
	sttclrl	wzr, [sp]
	sttclrl	x0, [x0]
	sttclrl	x0, [sp]
	sttclrl	xzr, [x0]
	sttclrl	xzr, [sp]

ldtset:
	ldtset	w0, w0, [x0]
	ldtset	w0, w0, [sp]
	ldtset	w0, wzr, [x0]
	ldtset	w0, wzr, [sp]
	ldtset	wzr, w0, [x0]
	ldtset	wzr, w0, [sp]
	ldtset	wzr, wzr, [x0]
	ldtset	wzr, wzr, [sp]
	ldtset	w0, w29, [x0]
	ldtset	w0, w29, [sp]
	ldtset	wzr, w29, [x0]
	ldtset	wzr, w29, [sp]
	ldtset	x0, x0, [x0]
	ldtset	x0, x0, [sp]
	ldtset	x0, xzr, [x0]
	ldtset	x0, xzr, [sp]
	ldtset	xzr, x0, [x0]
	ldtset	xzr, x0, [sp]
	ldtset	xzr, xzr, [x0]
	ldtset	xzr, xzr, [sp]
	ldtset	x0, x29, [x0]
	ldtset	x0, x29, [sp]
	ldtset	xzr, x29, [x0]
	ldtset	xzr, x29, [sp]

sttset:
	sttset	w0, [x0]
	sttset	w0, [sp]
	sttset	wzr, [x0]
	sttset	wzr, [sp]
	sttset	x0, [x0]
	sttset	x0, [sp]
	sttset	xzr, [x0]
	sttset	xzr, [sp]

ldtseta:
	ldtseta	w0, w0, [x0]
	ldtseta	w0, w0, [sp]
	ldtseta	w0, wzr, [x0]
	ldtseta	w0, wzr, [sp]
	ldtseta	wzr, w0, [x0]
	ldtseta	wzr, w0, [sp]
	ldtseta	wzr, wzr, [x0]
	ldtseta	wzr, wzr, [sp]
	ldtseta	x0, x0, [x0]
	ldtseta	x0, x0, [sp]
	ldtseta	x0, xzr, [x0]
	ldtseta	x0, xzr, [sp]
	ldtseta	xzr, x0, [x0]
	ldtseta	xzr, x0, [sp]
	ldtseta	xzr, xzr, [x0]
	ldtseta	xzr, xzr, [sp]

ldtsetal:
	ldtsetal	w0, w0, [x0]
	ldtsetal	w0, w0, [sp]
	ldtsetal	w0, wzr, [x0]
	ldtsetal	w0, wzr, [sp]
	ldtsetal	wzr, w0, [x0]
	ldtsetal	wzr, w0, [sp]
	ldtsetal	wzr, wzr, [x0]
	ldtsetal	wzr, wzr, [sp]
	ldtsetal	x0, x0, [x0]
	ldtsetal	x0, x0, [sp]
	ldtsetal	x0, xzr, [x0]
	ldtsetal	x0, xzr, [sp]
	ldtsetal	xzr, x0, [x0]
	ldtsetal	xzr, x0, [sp]
	ldtsetal	xzr, xzr, [x0]
	ldtsetal	xzr, xzr, [sp]

ldtsetl:
	ldtsetl	w0, w0, [x0]
	ldtsetl	w0, w0, [sp]
	ldtsetl	w0, wzr, [x0]
	ldtsetl	w0, wzr, [sp]
	ldtsetl	wzr, w0, [x0]
	ldtsetl	wzr, w0, [sp]
	ldtsetl	wzr, wzr, [x0]
	ldtsetl	wzr, wzr, [sp]
	ldtsetl	w0, w29, [x0]
	ldtsetl	w0, w29, [sp]
	ldtsetl	wzr, w29, [x0]
	ldtsetl	wzr, w29, [sp]
	ldtsetl	x0, x0, [x0]
	ldtsetl	x0, x0, [sp]
	ldtsetl	x0, xzr, [x0]
	ldtsetl	x0, xzr, [sp]
	ldtsetl	xzr, x0, [x0]
	ldtsetl	xzr, x0, [sp]
	ldtsetl	xzr, xzr, [x0]
	ldtsetl	xzr, xzr, [sp]
	ldtsetl	x0, x29, [x0]
	ldtsetl	x0, x29, [sp]
	ldtsetl	xzr, x29, [x0]
	ldtsetl	xzr, x29, [sp]

sttsetl:
	sttsetl	w0, [x0]
	sttsetl	w0, [sp]
	sttsetl	wzr, [x0]
	sttsetl	wzr, [sp]
	sttsetl	x0, [x0]
	sttsetl	x0, [sp]
	sttsetl	xzr, [x0]
	sttsetl	xzr, [sp]

ldtnp:
	ldtnp	x0, x2, [x0]
	ldtnp	x0, x2, [x0, #-8]
	ldtnp	x0, x2, [sp]
	ldtnp	x0, x2, [sp, #-8]
	ldtnp	x0, xzr, [x0]
	ldtnp	x0, xzr, [x0, #-8]
	ldtnp	x0, xzr, [sp]
	ldtnp	x0, xzr, [sp, #-8]
	ldtnp	xzr, x2, [x0]
	ldtnp	xzr, x2, [x0, #-8]
	ldtnp	xzr, x2, [sp]
	ldtnp	xzr, x2, [sp, #-8]
	ldtnp	xzr, x29, [x0]
	ldtnp	xzr, x29, [x0, #-8]
	ldtnp	xzr, x29, [sp]
	ldtnp	xzr, x29, [sp, #-8]

	ldtnp	q0, q2, [x0]
	ldtnp	q0, q2, [x0, #-16]
	ldtnp	q0, q2, [sp]
	ldtnp	q0, q2, [sp, #-16]
	ldtnp	q0, q31, [x0]
	ldtnp	q0, q31, [x0, #-16]
	ldtnp	q0, q31, [sp]
	ldtnp	q0, q31, [sp, #-16]
	ldtnp	q31, q0, [x0]
	ldtnp	q31, q0, [x0, #-16]
	ldtnp	q31, q0, [sp]
	ldtnp	q31, q0, [sp, #-16]
	ldtnp	q31, q29, [x0]
	ldtnp	q31, q29, [x0, #-16]
	ldtnp	q31, q29, [sp]
	ldtnp	q31, q29, [sp, #-16]

sttnp:
	sttnp	x0, x2, [x0]
	sttnp	x0, x2, [x0, #-8]
	sttnp	x0, x2, [sp]
	sttnp	x0, x2, [sp, #-8]
	sttnp	x0, xzr, [x0]
	sttnp	x0, xzr, [x0, #-8]
	sttnp	x0, xzr, [sp]
	sttnp	x0, xzr, [sp, #-8]
	sttnp	xzr, x2, [x0]
	sttnp	xzr, x2, [x0, #-8]
	sttnp	xzr, x2, [sp]
	sttnp	xzr, x2, [sp, #-8]
	sttnp	xzr, x29, [x0]
	sttnp	xzr, x29, [x0, #-8]
	sttnp	xzr, x29, [sp]
	sttnp	xzr, x29, [sp, #-8]

	sttnp	q0, q2, [x0]
	sttnp	q0, q2, [x0, #-16]
	sttnp	q0, q2, [sp]
	sttnp	q0, q2, [sp, #-16]
	sttnp	q0, q31, [x0]
	sttnp	q0, q31, [x0, #-16]
	sttnp	q0, q31, [sp]
	sttnp	q0, q31, [sp, #-16]
	sttnp	q31, q0, [x0]
	sttnp	q31, q0, [x0, #-16]
	sttnp	q31, q0, [sp]
	sttnp	q31, q0, [sp, #-16]
	sttnp	q31, q29, [x0]
	sttnp	q31, q29, [x0, #-16]
	sttnp	q31, q29, [sp]
	sttnp	q31, q29, [sp, #-16]
