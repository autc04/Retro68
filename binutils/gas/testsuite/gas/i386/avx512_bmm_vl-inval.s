# Check illegal 32bit AVX512_BMM,AVX512VL instructions

	.text
_start:
	vbmacor16x16x16 %xmm1, %xmm2, %xmm3
	vbmacxor16x16x16 %xmm1, %xmm2, %xmm3
