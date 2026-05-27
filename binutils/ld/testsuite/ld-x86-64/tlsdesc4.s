	.text
	.globl	_start
	.type	_start,@function
_start:
	leaq	foo@tlsdesc(%rip), %rcx
	call	*foo@tlscall(%rcx)
	.globl foo
	.section	.tdata,"awT",@progbits
	.align 8
	.type	foo, @object
	.size	foo, 8
foo:
	.quad	100
