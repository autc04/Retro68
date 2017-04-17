	.text
	.type foo,%gnu_indirect_function
foo:
	ret
	.globl _start
_start:
	call	foo@PLT
	.globl __start
__start:
	.data
	.dc.a foo
