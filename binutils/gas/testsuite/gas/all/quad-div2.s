	.offset
	.dc.a 0
	vasz = .

	.data

	.if vasz >= 8

	.quad INT_MIN / -1
	.quad INT_MIN % -1
	.quad LONG_MIN / -1
	.quad LONG_MIN % -1

	LONG_MIN = -0x8000000000000000

	.else

	/* Use .long to cover at least !BFD64 targets.  */
	.long INT_MIN / -1, 0
	.long INT_MIN % -1, 0
	/* Not really useful fallback for less-than-64-bit-VMA targets.  */
	.quad 0x8000000000000000
	.quad 0x0000000000000000

	.endif

	INT_MIN = -0x80000000
