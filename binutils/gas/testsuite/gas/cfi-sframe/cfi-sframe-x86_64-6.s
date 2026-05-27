# Testcase for transition of tracked entity (rip) from
# register to CFA+offset.
	.type	foo, @function
foo:
	.cfi_startproc
	sub	$0x20,%rsp
	.cfi_adjust_cfa_offset 0x20
	.long 0
	.cfi_register rip, 3
	mov %rax, %rdi
	.cfi_offset rip, -8
	.long 0
	.cfi_def_cfa rsp, 8
	ret
	.cfi_endproc
	.size	foo, .-foo
