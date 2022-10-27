	.text
	.intel_syntax noprefix

movs:
	movsb
	movsb	es:[edi], [esi]
	movsb	es:[edi], fs:[esi]
	movsw
	movsw	es:[edi], [esi]
	movsw	es:[edi], fs:[esi]
	movsd
	movsd	es:[edi], [esi]
	movsd	es:[edi], fs:[esi]
.ifdef x86_64
	movsq
	movsq	es:[rdi], [rsi]
	movsq	es:[rdi], fs:[rsi]
.endif
