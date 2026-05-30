	.text
	.globl	foo
	.type	foo, @function
foo:
	.cfi_startproc
	msgfi	%r2,42
	br	%r14
	.cfi_endproc
	.size	foo, .-foo
