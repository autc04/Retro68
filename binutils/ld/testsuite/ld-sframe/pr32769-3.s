	.section .text.foo
	.globl	foo
	.type 	foo, @function
foo:
	.cfi_startproc
	.byte 0
	.long coldx

	.section .text.foo.cold
	.type coldx, @function
coldx:
	.cfi_startproc
	.cfi_def_cfa_offset 16
	.byte 0
	.cfi_endproc

	.section .text.foo
1:	.byte 0
	.cfi_def_cfa_offset 16
	.cfi_endproc
	.size	foo, .-foo
