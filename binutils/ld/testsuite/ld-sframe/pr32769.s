	.text
	.globl	foo
	.type 	foo, @function
foo:
	.cfi_startproc
	.byte 0
	.cfi_endproc
	.size	foo, .-foo
