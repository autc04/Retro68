	.cfi_startproc
	stmg	%r14,%r15,112(%r15)
	.cfi_offset 14, -48
	.cfi_offset 15, -40
	nop
	.cfi_undefined 14
	lmg	%r14,%r15,112(%r15)
	.cfi_restore 15
	.cfi_restore 14
	br	%r14
	.cfi_endproc
