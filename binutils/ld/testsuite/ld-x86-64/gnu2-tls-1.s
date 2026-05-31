	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	leaq	foo@TLSDESC(%rip), %rax
	call	*foo@TLSCALL(%rax)
	movl	%fs:(%rax), %eax
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
