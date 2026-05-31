	.text
	.intel_syntax noprefix
bnd:
	mov	eax, bnd0
	bndmov	bnd0, bnd0
	.p2align 4,0
