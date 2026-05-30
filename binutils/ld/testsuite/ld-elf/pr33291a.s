	.globl	foo
	.section	.rodata.cst8,"aM",%progbits,8
	.p2align 3
	.type	foo, %object
	.size	foo, 8
foo:
	.quad	131073
	.section	.note.GNU-stack,"",%progbits
