	.arch	armv9.6-a+mops-go

	.macro	pme_seq, op, suffix, r1, r2
	\op\()p\()\suffix \r1, \r2
	\op\()m\()\suffix \r1, \r2
	\op\()e\()\suffix \r1, \r2
	.endm

	.macro	set_op1_op2, op, suffix
	pme_seq	\op, \suffix, [x0]!, x1!
	pme_seq	\op, \suffix, [x1]!, x0!
	pme_seq	\op, \suffix, [x15]!, x16!
	pme_seq	\op, \suffix, [x2]!, x30!
	pme_seq	\op, \suffix, [x30]!, x2!
	.endm

	.macro	set_all, op
	set_op1_op2 \op
	set_op1_op2 \op, t
	set_op1_op2 \op, n
	set_op1_op2 \op, tn
	.endm

	set_all	setgo
