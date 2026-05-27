	.cfi_sections .sframe
	.cfi_startproc
	stmg	%r6,%r15,48(%r15)
	.cfi_offset 6, -112
	.cfi_offset 7, -104
	.cfi_offset 8, -96
	.cfi_offset 9, -88
	.cfi_offset 10, -80
	.cfi_offset 11, -72
	.cfi_offset 12, -64
	.cfi_offset 13, -56
	.cfi_offset 14, -48
	.cfi_offset 15, -40
	lay	%r15,-160(%r15)
	.cfi_def_cfa_offset 320
	lgr	%r10,%r15
	.cfi_def_cfa 10, 320		# non-default frame pointer register
	lay	%r15,-128(%r15)
.Lreturn:
	lmg	%r6,%r15,160+48(%r10)
	.cfi_remember_state
	.cfi_restore 15
	.cfi_restore 14
	.cfi_restore 13
	.cfi_restore 12
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_def_cfa 15, 160
	br	%r14
	.cfi_restore_state
	lay	%r15,-128(%r15)
	j	.Lreturn
	.cfi_endproc
