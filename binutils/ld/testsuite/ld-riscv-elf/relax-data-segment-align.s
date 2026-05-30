	.text
	.globl _start
_start:
	.rept 6000
	lla a0, symbol
	.endr

	.section .rodata
	.set symbol, . + 4598
	.fill 100, 4, 1

	.data
	.align 3
	.rept 860
	.long 0x1000
	.endr
