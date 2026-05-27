	.text
	.globl	func
	.type	func, @function
func:
	call	*foo@GOT(%ebx)
	jmp	bar@PLT
	.section	.note.GNU-stack,"",@progbits
