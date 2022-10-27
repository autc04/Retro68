# Check 64bit instructions with optimized encoding

	.arch .avx512vl

.include "x86-64-optimize-2.s"

	{evex} vandnpd %zmm1, %zmm1, %zmm5
	{evex} vandnpd %ymm1, %ymm1, %ymm5
