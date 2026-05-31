// Test file for AArch64 bti.

	.text

	bti
	bti r
	bti c
	bti j
	bti jc

	bti R
	bti C
	bti J
	bti JC
