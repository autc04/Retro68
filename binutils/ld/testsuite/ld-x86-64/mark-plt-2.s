	.text
	.globl	foo
	.type	foo, @function
foo:
	subq	$8, %rsp
	leaq	xxx@TLSDESC(%rip), %rax
	.nops 10
	call	*xxx@TLSCALL(%rax)
	movl	%fs:(%rax), %eax
	addq	$8, %rsp
	call	bar
	ret
	.section	.note.GNU-stack,"",@progbits
