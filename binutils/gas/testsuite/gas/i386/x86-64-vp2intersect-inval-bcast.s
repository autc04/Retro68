# Check error for invalid {1toXX} and {2toXX} broadcasts.

	.text
_start:
	vp2intersectd 8(%rax){1to8}, %zmm2, %k2
	vp2intersectd 8(%rax){1to4}, %ymm2, %k2
	vp2intersectd 8(%rax){1to2}, %xmm2, %k2
	vp2intersectq 8(%rax){1to16}, %zmm2, %k2
	vp2intersectq 8(%rax){1to8}, %ymm2, %k2
	vp2intersectq 8(%rax){1to4}, %xmm2, %k2

	.intel_syntax noprefix
	vp2intersectd k4, zmm2, 8[rax]{1to8}
	vp2intersectd k4, ymm2, 8[rax]{1to4}
	vp2intersectd k4, xmm2, 8[rax]{1to2}
	vp2intersectq k4, zmm2, 8[rax]{1to16}
	vp2intersectq k4, ymm2, 8[rax]{1to8}
	vp2intersectq k4, xmm2, 8[rax]{1to4}
