	.text
	.globl	__foo
	.type	__foo, %function
__foo:
	.byte 0
	.globl	__foo1
	.set __foo1, __foo
	.symver __foo,foo@@VERS.2
	.symver __foo1,foo@VERS.1
