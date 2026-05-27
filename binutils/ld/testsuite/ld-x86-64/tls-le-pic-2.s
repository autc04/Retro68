	.text
	.p2align 4
	.globl	func
	.type	func, @function
func:
	movq	%fs:0, %rax
	addq	$foo@tpoff, %rax
	ret
	.size	func, .-func
	.section	.note.GNU-stack,"",@progbits
