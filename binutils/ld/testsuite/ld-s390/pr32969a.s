	.text
	.globl _start
	.type _start,@function
_start:
	lgrl	%r1,foo@GOTENT
	lgrl	%r1,bar@GOTENT

	.section .rodata,"a",@progbits
	.align 1
	.globl foo
	.type foo,@object
foo:
	.byte 0xa
	.size foo, .-foo
