target:
	fadd.s	a0, a1, a2
	fsub.s	a0, a1, a2
	fmul.s	a0, a1, a2
	fdiv.s	a0, a1, a2
	fsqrt.s	a0, a0
	fmin.s	a0, a1, a2
	fmax.s	a0, a1, a2
	fmadd.s	a0, a1, a2, a3
	fnmadd.s	a0, a1, a2, a3
	fmsub.s	a0, a1, a2, a3
	fnmsub.s	a0, a1, a2, a3
	fcvt.w.s	a0, a1
	fcvt.wu.s	a0, a1
	fcvt.l.s	a0, a1
	fcvt.lu.s	a0, a1
	fcvt.s.w	a0, a1
	fcvt.s.wu	a0, a1
	fcvt.s.l	a0, a1
	fcvt.s.lu	a0, a1
	fsgnj.s	a0, a1, a2
	fsgnjn.s	a0, a1, a2
	fsgnjx.s	a0, a1, a2
	feq.s	a0, a1, a2
	flt.s	a0, a1, a2
	fle.s	a0, a1, a2
	fgt.s	a0, a1, a2
	fge.s	a0, a1, a2
	fneg.s  a0, a0
	fabs.s	a0, a0
	fclass.s	a0, a1
