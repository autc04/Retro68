	.type	foo, @function
foo:
	.cfi_startproc
	sub	$0x20,%rsp
	.cfi_adjust_cfa_offset 0x20
	.long 0
	# DW_CFA_def_cfa_expression, length, DW_OP_breg6, (sleb)offset, DW_OP_deref
	.cfi_escape 0xf,0x3,0x76,sleb128(-48),0x6
	mov %rax, %rdi
	.cfi_def_cfa rsp, 8
	.long 0
	.cfi_endproc
	.size	foo, .-foo
