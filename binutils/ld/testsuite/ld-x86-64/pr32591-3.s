	.text
	.globl  _start
	.type	_start, @function
_start:
	movq	foo@GOTPCREL(%rip), %rax
	addq	foo@GOTPCREL(%rip), %rbx
	.size	_start, .-_start
