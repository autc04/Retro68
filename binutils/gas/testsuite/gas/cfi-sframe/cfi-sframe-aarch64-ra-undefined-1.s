	.cfi_startproc
	stp	fp, lr, [sp, #-16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	nop
	.cfi_undefined 30
	ldp	fp, lr, [sp], #16
	.cfi_restore 20
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret	lr
	.cfi_endproc
