# Testcase to check FLEX FDE generation for .cfi_register RIP, XX
	.type	foo, @function
foo:
	.cfi_startproc
	sub	$0x20,%rsp
	.cfi_adjust_cfa_offset 0x20
	popq	%rcx
	.cfi_register rip, 2
	.cfi_def_cfa_offset 0
	jmp	*%rcx
	.cfi_endproc
	.size	foo, .-foo
