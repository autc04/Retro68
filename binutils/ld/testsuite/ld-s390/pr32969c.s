c:
	lgrl	%r1,bar@GOTENT

	.section .rodata,"aG",@progbits,bar_group,comdat
	.align 2
	.globl bar
	.type bar,@object
bar:
	.byte 0xc
	.size bar, .-bar
