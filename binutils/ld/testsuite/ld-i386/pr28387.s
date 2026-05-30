	.text
	.p2align 4
	.globl	main
	.type	main, @function
main:
	leal	foo@TLSDESC(%ebx), %eax
	call	*foo@TLSCALL(%eax)
	call	bar@PLT
	ret
	.data
	.dc.a	foo
	.section	.note.GNU-stack,"",@progbits
