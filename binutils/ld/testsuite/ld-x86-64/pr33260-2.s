	.text
	.p2align 4
	.globl	my_func
	.type	my_func, @function
my_func:
	.cfi_startproc
	movq	my_data@GOTPCREL(%rip), %rax
	ret
	.cfi_endproc
	.size	my_func, .-my_func
	.protected	my_data
	.globl	my_data
	.bss
	.align 4
	.type	my_data, @object
	.size	my_data, 4
my_data:
	.zero	4
	.section	.note.GNU-stack,"",@progbits
