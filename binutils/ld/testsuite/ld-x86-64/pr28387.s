	.text
	.globl	main
	.type	main, @function
main:
	leaq	foo@TLSDESC(%rip), %rax
	call	*foo@TLSCALL(%rax)
	call	bar@PLT
	ret
	.data
	.dc.a	foo
	.section	.note.GNU-stack,"",@progbits
