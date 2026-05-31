# Check Illegal 64-bit AVX512_BMM instructions

	.text
	#vbmacor16x16x16 %xmm7, %xmm2, %xmm0 set EVEX.L'L = 0 (illegal value).
	.insn EVEX.128.NP.M6.W0 0x80, %xmm7, %xmm2, %xmm0

	#vbmacxor16x16x16 %xmm7, %xmm2, %xmm0 set EVEX.L'L = 0 (illegal value).
	.insn EVEX.128.NP.M6.W1 0x80, %xmm7, %xmm2, %xmm0
