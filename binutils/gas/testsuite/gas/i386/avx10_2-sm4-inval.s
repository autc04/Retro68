# Check Illegal 32bit SM4 instructions

	.text
	.arch .noavx10.2
_start:
	vsm4key4	%zmm4, %zmm5, %zmm6 
	vsm4rnds4	%zmm4, %zmm5, %zmm6
	{evex} vsm4key4	%ymm4, %ymm5, %ymm6 
	{evex} vsm4rnds4	%xmm4, %xmm5, %xmm6
