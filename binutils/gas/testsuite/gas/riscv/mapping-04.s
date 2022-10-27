	.text
	.option	arch, -c
	.fill	2, 4, 0x1001
	.byte	1
	.word	0
	.balign	8
	add	a0, a0, a0
	.fill	5, 2, 0x2002
	add	a1, a1, a1

	.data
	.word	0x1
	.word	0x2
