	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	nop
	.cfi_undefined 16
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
