	.set	noreorder
1:	eret
	.set	reorder
	b	1b

1:	eret
	.set	noreorder
	b	1b
	.set	reorder
