target:
	fadd.d	a0, a1, a2
	fsub.d	a0, a1, a2
	fmul.d	a0, a1, a2
	fdiv.d	a0, a1, a2
	fsqrt.d	a0, a0
	fmin.d	a0, a1, a2
	fmax.d	a0, a1, a2
	fmadd.d	a0, a1, a2, a3
	fnmadd.d	a0, a1, a2, a3
	fmsub.d	a0, a1, a2, a3
	fnmsub.d	a0, a1, a2, a3
	fcvt.w.d	a0, a1
	fcvt.wu.d	a0, a1
	fcvt.l.d	a0, a1
	fcvt.lu.d	a0, a1
	fcvt.s.d	a0, a1
	fcvt.d.s	a0, a1
	fcvt.d.w	a0, a1
	fcvt.d.wu	a0, a1
	fcvt.d.l	a0, a1
	fcvt.d.lu	a0, a1
	fsgnj.d	a0, a1, a2
	fsgnjn.d	a0, a1, a2
	fsgnjx.d	a0, a1, a2
	feq.d	a0, a1, a2
	flt.d	a0, a1, a2
	fle.d	a0, a1, a2
	fgt.d	a0, a1, a2
	fge.d	a0, a1, a2
	fneg.d  a0, a0
	fabs.d	a0, a0
	fclass.d	a0, a1
