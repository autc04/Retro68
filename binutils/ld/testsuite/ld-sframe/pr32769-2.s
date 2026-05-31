	.section .text.foo
	.globl	foo
	.type 	foo, @function
foo:
	.cfi_startproc
	.byte 0

	.section .text.foo.cold
coldx:
	.cfi_startproc
	.cfi_def_cfa_offset 16
	.byte 0
	.cfi_endproc

	.section .text.foo
	.byte 0
	.cfi_def_cfa_offset 16
	.cfi_endproc
	.size	foo, .-foo
