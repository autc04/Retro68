	.section	.data.rel,"aw",%progbits
	.type	q, %object
q:
.ifdef __64_bit__
	.quad	_start
.else
	.word	_start
.endif
