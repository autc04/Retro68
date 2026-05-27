	.type	foo, @function
foo:
	.cfi_startproc
	.cfi_signal_frame
# DW_CFA_def_cfa_expression, length, DW_OP_breg9, (sleb)offset, DW_OP_deref
	.cfi_escape 0xf,0x3,0x79,0x78,0x6
	nop
	pop	%rbp
	.cfi_offset rbp, -16
	ret
	.cfi_endproc
	.size	foo, .-foo
