a:
	.rept 257
	nop
	.endr
	cbgt w0, w1, a

	cbgt w0, w1, b
	.rept 255
	nop
	.endr

b:
	nop
