	.data

	.eqv INT_MAX, 0x7fffffff
	.eqv INT_MIN, -INT_MAX - 1

	/* Note: Shifts are uniformly done as unsigned.  */
	.rept (INT_MIN / -1) >> 31
	.quad -0x80000000 / -1
	.endr
	.rept (INT_MIN % -1) + 1
	.quad -0x80000000 % -1
	.endr

	.if ((1 << 16) << 16) <> 0

	.eqv LONG_MAX, 0x7fffffffffffffff
	.eqv LONG_MIN, -LONG_MAX - 1

	/* Note: Shifts are uniformly done as unsigned.  */
	.rept (LONG_MIN / -1) >> 63
	.quad -0x8000000000000000 / -1
	.endr
	.rept (LONG_MIN % -1) + 1
	.quad -0x8000000000000000 % -1
	.endr

	.else /* Not really useful fallback for non-BFD64 targets.  */

	.quad 0x8000000000000000
	.quad 0x0000000000000000

	.endif
