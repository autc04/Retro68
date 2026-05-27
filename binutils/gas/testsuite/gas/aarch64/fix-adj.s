	.section .text.1, "ax", @progbits
	.type f1, %function
	.p2align 2
	nop
f1:
	nop
	.section .text.2, "ax", @progbits
	.global f2
	.type f2, %function
	.p2align 2
f2:
	bl	f1
	b	f1
