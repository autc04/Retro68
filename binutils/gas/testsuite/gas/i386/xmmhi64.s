	.text
	.intel_syntax noprefix
	.code64
xmm:
	{vex2} vaddps	xmm0, xmm1, xmm16
	{vex2} vaddps	ymm0, ymm1, ymm16
	{vex2} vaddps	zmm0, zmm1, zmm16
