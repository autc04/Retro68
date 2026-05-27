	.text

# All the following should yield "operand type mismatch" (or something yet more
# specific), but _not_ "operand size mismatch".

	blendvps %eax, %xmm1, %xmm2
	blendvps %st, %xmm1, %xmm2
	bsf	%eax, (%eax)
	bswap	%st
	bswap	%mm0
	bswapl	%xmm0
	fcomi	%st(1), %eax
	fcomi	%st(1), %xmm0
	inl	$0, %st
	inl	$0, %xmm0
	movntdqa %xmm0, (%eax)
	movntdq	(%eax), %xmm0
