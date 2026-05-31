# Testcase for creation of flex FDE for offset divergence from fixed offset on
# AMD64
	.type	foo, @function
foo:
	.cfi_startproc
	sub	$0x20,%rsp
	.cfi_adjust_cfa_offset 0x20
	.long 0
	mov	%rax, %rdi
	.cfi_offset rip, -16
	.long 0
	.cfi_def_cfa rsp, 8
	.long 0
	.cfi_offset rip, -8
	ret
	.cfi_endproc
	.size	foo, .-foo
