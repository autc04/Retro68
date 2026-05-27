# Check 32bit AVX512_BMM instructions

	.text
bmm:
	.arch .noavx512vl
	vbmacor16x16x16 %zmm1, %zmm2, %zmm3		# AVX512_BMM
	vbmacor16x16x16 -123456(%esp,%esi,8), %zmm1, %zmm2		# AVX512_BMM
	vbmacor16x16x16 8192(%edx), %zmm1, %zmm2		# AVX512_BMM
	vbmacor16x16x16 -8192(%edx), %zmm1, %zmm2		# AVX512_BMM Disp8

	vbmacxor16x16x16 %zmm1, %zmm2, %zmm3		# AVX512_BMM
	vbmacxor16x16x16 -123456(%esp,%esi,8), %zmm1, %zmm2		# AVX512_BMM
	vbmacxor16x16x16 8192(%edx), %zmm1, %zmm2		# AVX512_BMM
	vbmacxor16x16x16 -8192(%edx), %zmm1, %zmm2		# AVX512_BMM Disp8

	vbitrevb %zmm1, %zmm2		# AVX512_BMM
	vbitrevb %zmm1, %zmm2{%k1}{z}		# AVX512_BMM
	vbitrevb -123456(%esp,%esi,8), %zmm2		# AVX512_BMM
	vbitrevb -123456(%esp,%esi,8), %zmm2{%k1}{z}		# AVX512_BMM
	vbitrevb 8192(%edx), %zmm2{%k1}{z}		# AVX512_BMM
	vbitrevb -8192(%edx), %zmm2{%k1}{z}		# AVX512_BMM Disp8
