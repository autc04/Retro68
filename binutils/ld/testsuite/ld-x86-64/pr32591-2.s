	.text
	.p2align 4
	.globl	_start
	.type	_start, @function
_start:
	movq	__stack_chk_guard@GOTPCREL(%rip), %rax
	.globl	__stack_chk_guard
	.section	.rodata
	.align 8
	.type	__stack_chk_guard, @object
__stack_chk_guard:
	.quad -1
	.section	.note.GNU-stack,"",@progbits
