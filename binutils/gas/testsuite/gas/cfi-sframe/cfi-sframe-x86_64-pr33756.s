	.text
	.type	foo, @function
foo:
	.cfi_startproc
	.cfi_remember_state
	.long 0
	.cfi_def_cfa_offset 16
	.long 0
	.long 0
	.cfi_restore_state
	.long 0
	.cfi_endproc
	.size	foo, .-foo
