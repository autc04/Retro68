	.text
	.globl	func
	.type	func, @function
func:
	lgrl	%r1,foo@GOTENT
	brasl	%r14,bar@PLT
	.section	.note.GNU-stack,"",@progbits
