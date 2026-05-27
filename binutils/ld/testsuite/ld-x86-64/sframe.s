	.text
	.p2align 4
	.globl	foo
	.type	foo, @function
foo:
	.cfi_startproc
	ret
	.cfi_endproc
	.size	foo, .-foo
	.section	.note.GNU-stack,"",@progbits
