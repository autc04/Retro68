	.text
	.type foo, @function
foo:
	.cfi_startproc
	.cfi_remember_state
	stmg	%r6,%r15,48(%r15)
	.cfi_rel_offset 6, 48
	.cfi_rel_offset 7, 56
	.cfi_rel_offset 8, 64
	.cfi_rel_offset 9, 72
	.cfi_rel_offset 10, 80
	.cfi_rel_offset 11, 88
	.cfi_rel_offset 12, 96
	.cfi_rel_offset 13, 104
	.cfi_rel_offset 14, 112
	.cfi_rel_offset 15, 120
	lay	%r15,-160(%r15)
	.cfi_adjust_cfa_offset 160
	lmg	%r6,%r15,160+48(%r15)
	.cfi_restore_state
	br	%r14
	.cfi_endproc
	.size foo, .-foo
