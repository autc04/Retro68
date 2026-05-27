# Check 64bit SM4 instructions

	.text
_start:
	vsm4key4	%zmm28, %zmm29, %zmm30
	vsm4key4	0x10000000(%rbp, %r14, 8), %zmm29, %zmm30
	vsm4key4	(%r9), %zmm29, %zmm30
	vsm4key4	8128(%rcx), %zmm29, %zmm30
	vsm4key4	-8192(%rdx), %zmm29, %zmm30
	vsm4rnds4	%zmm28, %zmm29, %zmm30
	vsm4rnds4	0x10000000(%rbp, %r14, 8), %zmm29, %zmm30
	vsm4rnds4	(%r9), %zmm29, %zmm30
	vsm4rnds4	8128(%rcx), %zmm29, %zmm30
	vsm4rnds4	-8192(%rdx), %zmm29, %zmm30

_intel:
	.intel_syntax noprefix
	vsm4key4	zmm30, zmm29, zmm28
	vsm4key4	zmm30, zmm29, [rbp+r14*8+0x10000000]
	vsm4key4	zmm30, zmm29, ZMMWORD PTR [r9]
	vsm4key4	zmm30, zmm29, [rcx+8128]
	vsm4key4	zmm30, zmm29, ZMMWORD PTR [rdx-8192]
	vsm4rnds4	zmm30, zmm29, zmm28
	vsm4rnds4	zmm30, zmm29, [rbp+r14*8+0x10000000]
	vsm4rnds4	zmm30, zmm29, ZMMWORD PTR [r9]
	vsm4rnds4	zmm30, zmm29, ZMMWORD PTR [rcx+8128]
	vsm4rnds4	zmm30, zmm29, [rdx-8192]
