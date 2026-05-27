	.text
	.globl	func
	.type	func, @function
func:
	call	*foo@GOTPCREL(%rip)
	jmp	bar@PLT
	.section	.note.GNU-stack,"",@progbits
