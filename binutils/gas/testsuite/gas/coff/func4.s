	.file	"func4.c"

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

	.data
item1:	.long -1

	.text
	fcn outer
	.nop
	.nop
	efcn outer

	.data
item2:	.long -2

	.text
	.global	test
	fcn test
	.nop
	.nop
	.nop
	efcn test
