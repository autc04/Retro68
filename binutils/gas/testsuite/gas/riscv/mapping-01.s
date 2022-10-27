	.option arch, -c
	.text
	.global	funcA
funcA:
	add	a0, a0, a0
	j	funcB
	.global	funcB
funcB:
	add	a1, a1, a1
	bne	a0, a1, funcB

	.data
	.word 0x123456

	.section	.foo, "ax"
foo:
	add	a2, a2, a2
