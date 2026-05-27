# Check 64bit AVX512_BMM,AVX512VL instructions

	.text
bmm:
	vbmacor16x16x16 %ymm1, %ymm2, %ymm3		# AVX512_BMM,AVX512VL
	vbmacor16x16x16 -123456(%esp,%esi,8), %ymm1, %ymm2		# AVX512_BMM,AVX512VL
	vbmacor16x16x16 4096(%edx), %ymm1, %ymm2		# AVX512_BMM,AVX512VL
	vbmacor16x16x16 -4096(%edx), %ymm1, %ymm2		# AVX512_BMM,AVX512VL Disp8

	vbmacxor16x16x16 %ymm1, %ymm2, %ymm3		# AVX512_BMM,AVX512VL
	vbmacxor16x16x16 -123456(%esp,%esi,8), %ymm1, %ymm2		# AVX512_BMM,AVX512VL
	vbmacxor16x16x16 4096(%edx), %ymm1, %ymm2		# AVX512_BMM,AVX512VL
	vbmacxor16x16x16 -4096(%edx), %ymm1, %ymm2		# AVX512_BMM,AVX512VL Disp8

	vbitrevb %xmm1, %xmm2		# AVX512_BMM,AVX512VL
	vbitrevb %xmm1, %xmm2{%k1}{z}		# AVX512_BMM,AVX512VL
	vbitrevb -123456(%esp,%esi,8), %xmm2		# AVX512_BMM,AVX512VL
	vbitrevb -123456(%esp,%esi,8), %xmm2{%k1}{z}		# AVX512_BMM,AVX512VL
	vbitrevb 2048(%edx), %xmm2{%k1}{z}		# AVX512_BMM,AVX512VL
	vbitrevb -2048(%edx), %xmm2{%k1}{z}		# AVX512_BMM,AVX512VL Disp8
	vbitrevb %ymm1, %ymm2		# AVX512_BMM,AVX512VL
	vbitrevb %ymm1, %ymm2{%k1}{z}		# AVX512_BMM,AVX512VL
	vbitrevb -123456(%esp,%esi,8), %ymm2		# AVX512_BMM,AVX512VL
	vbitrevb -123456(%esp,%esi,8), %ymm2{%k1}{z}		# AVX512_BMM,AVX512VL
	vbitrevb 4096(%eax), %ymm2{%k1}{z}		# AVX512_BMM,AVX512VL
	vbitrevb -4096(%eax), %ymm2{%k1}{z}		# AVX512_BMM,AVX512VL Disp8
