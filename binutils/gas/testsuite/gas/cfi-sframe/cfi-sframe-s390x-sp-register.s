	.cfi_sections .sframe
	.cfi_startproc
	ldgr	%f1,%r15
	.cfi_register r15, f1
	lay	%r15,-160(%r15)
	.cfi_adjust_cfa_offset 160
	lgdr	%r15,%f1
	.cfi_restore r15
	.cfi_adjust_cfa_offset -160
	br	%r14
	.cfi_endproc
