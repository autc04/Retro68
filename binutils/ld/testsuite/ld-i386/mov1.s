	.text
	.globl	_start
	.type	_start, @function
_start:
	movl	_DYNAMIC@GOT(%ecx), %eax
	.size	_start, .-_start
