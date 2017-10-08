        .global entry
        .text
entry:
	fstd	d0, [r0], #8
	fstd	d0, [r0, #-8]!
	fsts	s0, [r0], #8
	fsts	s0, [r0, #-8]!
	fldd	d0, [r0], #8
	fldd	d0, [r0, #-8]!
	flds	s0, [r0], #8
	flds	s0, [r0, #-8]!
	vmrs	r0, MVFR2
	vmsr	MVFR2, r2
