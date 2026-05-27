	.text
	.globl  _start
	.type	_start, @function
_start:
	movq	__ehdr_start@GOTPCREL(%rip), %rax
	addq	__ehdr_start@GOTPCREL(%rip), %rbx
	.size	_start, .-_start
