	.file	"func2.c"

	.macro fcn, name
	.def	\name
	.scl	3		/* C_STAT */
	.type	32		/* DT_FUNC */
	.endef
\name:
	.endm

	.macro efcn, name
	.def	.\name
	.scl	255		/* C_EFCN */
	.val	.
	.endef
	.endm

	.text

	fcn inner
	.nop
	efcn inner

	fcn outer
	.nop
	.nop
	efcn outer

	.global	test
	fcn test
	.nop
	.nop
	.nop
	efcn test
