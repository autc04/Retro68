	.file	"func1.c"
	.text
	.macro fcn, name
	.def	\name
	.scl	3		/* C_STAT */
	.type	32		/* DT_FUNC */
	.endef
\name:
	.endm

	fcn inner
	.nop

	fcn outer
	.nop
	.nop

	.global	test
	fcn test
	.nop
	.nop
	.nop
