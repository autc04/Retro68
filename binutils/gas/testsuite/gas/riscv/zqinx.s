target:
	fadd.q	a0, a1, a2
	fsub.q	a0, a1, a2
	fmul.q	a0, a1, a2
	fdiv.q	a0, a1, a2
	fsqrt.q	a0, a0
	fmin.q	a0, a1, a2
	fmax.q	a0, a1, a2
	fmadd.q	a0, a1, a2, a3
	fnmadd.q	a0, a1, a2, a3
	fmsub.q	a0, a1, a2, a3
	fnmsub.q	a0, a1, a2, a3
	fcvt.w.q	a0, a1
	fcvt.wu.q	a0, a1
	fcvt.l.q	a0, a1
	fcvt.lu.q	a0, a1
	fcvt.s.q	a0, a1
	fcvt.d.q	a0, a1
	fcvt.q.s	a0, a1
	fcvt.q.d	a0, a1
	fcvt.q.w	a0, a1
	fcvt.q.wu	a0, a1
	fcvt.q.l	a0, a1
	fcvt.q.lu	a0, a1
	fsgnj.q	a0, a1, a2
	fsgnjn.q	a0, a1, a2
	fsgnjx.q	a0, a1, a2
	feq.q	a0, a1, a2
	flt.q	a0, a1, a2
	fle.q	a0, a1, a2
	fgt.q	a0, a1, a2
	fge.q	a0, a1, a2
	fneg.q  a0, a0
	fabs.q	a0, a0
	fclass.q	a0, a1
