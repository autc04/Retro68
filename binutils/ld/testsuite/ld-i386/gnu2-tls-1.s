	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	leal	ld@TLSDESC(%ebx), %eax
	call	*ld@TLSCALL(%eax)
	addl	%gs:0, %eax
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
