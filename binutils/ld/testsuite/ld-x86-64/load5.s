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
	      pushq	bar@GOTPCREL(%rip)
	{rex} pushq	foo@GOTPCREL(%rip)
	.size	_start, .-_start
