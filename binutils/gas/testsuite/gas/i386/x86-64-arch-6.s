# Test -march=
	.text

	vbmacor16x16x16 %ymm1, %ymm2, %ymm3	#AVX512BMM
	vbcstnebf162ps (%edx), %xmm1		#AVX_NE_CONVERT
	vpmadd52huq %xmm1, %xmm1, %xmm2		#AVX_IFMA
	vpdpbssd %ymm1, %ymm2, %ymm3		#AVX_VNNI_INT8
	vaddph %zmm1, %zmm2, %zmm3		#AVX512-FP16
