# Check 64bit AVX512F,VPCLMULQDQ instructions

	.allow_index_reg
	.text
_start:
	vpclmulqdq	$0xab, %zmm24, %zmm23, %zmm26	 # AVX512F,VPCLMULQDQ
	vpclmulqdq	$123, 0x123(%rax,%r14,8), %zmm23, %zmm26	 # AVX512F,VPCLMULQDQ
	vpclmulqdq	$123, 8128(%rdx), %zmm23, %zmm26	 # AVX512F,VPCLMULQDQ Disp8

	.intel_syntax noprefix
	vpclmulqdq	zmm21, zmm21, zmm27, 0xab	 # AVX512F,VPCLMULQDQ
	vpclmulqdq	zmm21, zmm21, ZMMWORD PTR [rax+r14*8+0x1234], 123	 # AVX512F,VPCLMULQDQ
	vpclmulqdq	zmm21, zmm21, ZMMWORD PTR [rdx+8128], 123	 # AVX512F,VPCLMULQDQ Disp8
