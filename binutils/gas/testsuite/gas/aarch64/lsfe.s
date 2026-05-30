ldf:
	.irp op, add, max, maxnm, min, minnm
	.irp suffix, , a, al, l
		ldf\op\suffix	h0, h0, [x0]
		ldf\op\suffix	h0, h0, [sp]
		ldf\op\suffix	h0, h31, [x0]
		ldf\op\suffix	h0, h31, [sp]
		ldf\op\suffix	h31, h0, [x0]
		ldf\op\suffix	h31, h0, [sp]
		ldf\op\suffix	h31, h31, [x0]
		ldf\op\suffix	h31, h31, [sp]
		ldf\op\suffix	s0, s0, [x0]
		ldf\op\suffix	s0, s0, [sp]
		ldf\op\suffix	s0, s31, [x0]
		ldf\op\suffix	s0, s31, [sp]
		ldf\op\suffix	s31, s0, [x0]
		ldf\op\suffix	s31, s0, [sp]
		ldf\op\suffix	s31, s31, [x0]
		ldf\op\suffix	s31, s31, [sp]
		ldf\op\suffix	d0, d0, [x0]
		ldf\op\suffix	d0, d0, [sp]
		ldf\op\suffix	d0, d31, [x0]
		ldf\op\suffix	d0, d31, [sp]
		ldf\op\suffix	d31, d0, [x0]
		ldf\op\suffix	d31, d0, [sp]
		ldf\op\suffix	d31, d31, [x0]
		ldf\op\suffix	d31, d31, [sp]
	.endr
	.endr

ldbf:
	.irp op, add, max, maxnm, min, minnm
	.irp suffix, , a, al, l
		ldbf\op\suffix	h0, h0, [x0]
		ldbf\op\suffix	h0, h0, [sp]
		ldbf\op\suffix	h0, h31, [x0]
		ldbf\op\suffix	h0, h31, [sp]
		ldbf\op\suffix	h31, h0, [x0]
		ldbf\op\suffix	h31, h0, [sp]
		ldbf\op\suffix	h31, h31, [x0]
		ldbf\op\suffix	h31, h31, [sp]
	.endr
	.endr

stf:
	.irp op, add, max, maxnm, min, minnm
	.irp suffix, , l
		stf\op\suffix	h0, [x0]
		stf\op\suffix	h0, [sp]
		stf\op\suffix	h31, [x0]
		stf\op\suffix	h31, [sp]
		stf\op\suffix	s0, [x0]
		stf\op\suffix	s0, [sp]
		stf\op\suffix	s31, [x0]
		stf\op\suffix	s31, [sp]
		stf\op\suffix	d0, [x0]
		stf\op\suffix	d0, [sp]
		stf\op\suffix	d31, [x0]
		stf\op\suffix	d31, [sp]
	.endr
	.endr

stbf:
	.irp op, add, max, maxnm, min, minnm
	.irp suffix, , l
		stbf\op\suffix	h0, [x0]
		stbf\op\suffix	h0, [sp]
		stbf\op\suffix	h31, [x0]
		stbf\op\suffix	h31, [sp]
	.endr
	.endr
