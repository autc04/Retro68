	.section	sect, "axG", @progbits, sectgroup, comdat
	.global	_start
_start:
	.cfi_startproc
	call	foo
	.cfi_endproc
	.section	.note.GNU-stack,"",@progbits
