	.section	sec1,"ax",@progbits
	.globl	_start
	.type   _start, @function
_start:
	la.got	$a0,__start_sec1
	la.got	$a0,__stop_sec1
	.size   _start, .-_start

	.hidden	__start_sec1
	.hidden	__stop_sec1
