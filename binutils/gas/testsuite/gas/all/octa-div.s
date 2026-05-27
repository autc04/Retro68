	.data
	.octa -0x80000000 / -1
	.octa -0x80000000 % -1
	.if ((1 << 16) << 16) <> 0
	.octa -0x8000000000000000 / -1
	.octa -0x8000000000000000 % -1
	.else
	/* Not really useful fallback for non-BFD64 targets.  */
	.octa 0x8000000000000000
	.octa 0x0000000000000000
	.endif
