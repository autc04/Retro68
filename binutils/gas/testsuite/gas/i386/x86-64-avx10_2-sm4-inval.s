# Check Illegal 64bit SM4 instructions

	.text
	.arch .noavx10.2
_start:
	vsm4key4	%zmm28, %zmm29, %zmm30 
	vsm4rnds4	%zmm28, %zmm29, %zmm30
	vsm4key4	%ymm28, %ymm29, %ymm30 
	vsm4rnds4	%xmm28, %xmm29, %xmm30
