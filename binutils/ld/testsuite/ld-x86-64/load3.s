	.section	my_section,"aw",@progbits
	.long	0x12345678
	.text
	.type	foo, @function
foo:
	ret
	.size	foo, .-foo
	.globl	_start
	.type	_start, @function
_start:
	movrs	foo@GOTPCREL(%rip), %eax
	movrs	bar@GOTPCREL(%rip), %r11d
	movrs	bar@GOTPCREL(%rip), %r21d
	movrs	foo@GOTPCREL(%rip), %rax
	movrs	bar@GOTPCREL(%rip), %r11
	movrs	bar@GOTPCREL(%rip), %r21
	movrs	__start_my_section@GOTPCREL(%rip), %rax
	movrs	__stop_my_section@GOTPCREL(%rip), %r11
	.size	_start, .-_start
	.comm	pad,4,4
	.comm	bar,4,4
	.hidden bar
