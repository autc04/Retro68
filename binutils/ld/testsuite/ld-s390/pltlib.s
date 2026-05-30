	.text
	.globl foo
	.type foo,@function
foo:
	.cfi_startproc
	br	%r14
	.cfi_endproc
	.size foo,.-foo

	.globl bar
	.type bar,@function
bar:
	.cfi_startproc
	br	%r14
	.cfi_endproc
	.size bar,.-bar
