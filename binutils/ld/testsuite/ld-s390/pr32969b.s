b:
	lgrl	%r1,bar@GOTENT

	.section .rodata,"aG",@progbits,bar_group,comdat
	.align 1
	.globl bar
	.type bar,@object
bar:
	.byte 0xb
	.size bar, .-bar
