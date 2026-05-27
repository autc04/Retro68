	.data
	.type	bar, @object
bar:
	.byte	1
	.size	bar, .-bar
	.globl	foo
	.type	foo, @object
foo:
	.byte	1
	.size	foo, .-foo
	.text
	.globl	_start
	.type	_start, @function
_start:
	push	bar@GOT(%ecx)
	push	foo@GOT(%edx)
	.ifndef PIC
	push	foo@GOT
	.endif
	.size	_start, .-_start
