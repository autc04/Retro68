	.text
	.p2align 4
	.globl	func
	.type	func, @function
func:
	movq	%fs:0, %rax
	addq	$foo@tpoff, %rax
	ret
	.size	func, .-func
	.section	.tbss,"awT",@nobits
	.align 4
	.globl	foo
	.type	foo, @object
	.size	foo, 4
foo:
	.zero	4
	.section	.note.GNU-stack,"",@progbits
