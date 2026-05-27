# Check 64bit SM4 instructions

	.text
_start:
	vsm4key4	%ymm28, %ymm29, %ymm30 
	vsm4key4	%xmm28, %xmm29, %xmm30
	vsm4key4	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30
	vsm4key4	(%r9), %ymm29, %ymm30
	vsm4key4	4064(%rcx), %ymm29, %ymm30
	vsm4key4	-4096(%rdx), %ymm29, %ymm30
	vsm4key4	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30
	vsm4key4	(%r9), %xmm29, %xmm30
	vsm4key4	2032(%rcx), %xmm29, %xmm30
	vsm4key4	-2048(%rdx), %xmm29, %xmm30
	vsm4rnds4	%ymm28, %ymm29, %ymm30
	vsm4rnds4	%xmm28, %xmm29, %xmm30
	vsm4rnds4	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30
	vsm4rnds4	(%r9), %ymm29, %ymm30
	vsm4rnds4	4064(%rcx), %ymm29, %ymm30
	vsm4rnds4	-4096(%rdx), %ymm29, %ymm30
	vsm4rnds4	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30
	vsm4rnds4	(%r9), %xmm29, %xmm30
	vsm4rnds4	2032(%rcx), %xmm29, %xmm30
	vsm4rnds4	-2048(%rdx), %xmm29, %xmm30

_intel:
	.intel_syntax noprefix
	vsm4key4	ymm30, ymm29, ymm28
	vsm4key4	xmm30, xmm29, xmm28
	vsm4key4	ymm30, ymm29, [rbp+r14*8+0x10000000]
	vsm4key4	ymm30, ymm29, YMMWORD PTR [r9]
	vsm4key4	ymm30, ymm29, [rcx+4064]
	vsm4key4	ymm30, ymm29, YMMWORD PTR [rdx-4096]
	vsm4key4	xmm30, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vsm4key4	xmm30, xmm29, [r9]
	vsm4key4	xmm30, xmm29, [rcx+2032]
	vsm4key4	xmm30, xmm29, XMMWORD PTR [rdx-2048]
	vsm4rnds4	ymm30, ymm29, ymm28
	vsm4rnds4	xmm30, xmm29, xmm28
	vsm4rnds4	ymm30, ymm29, [rbp+r14*8+0x10000000]
	vsm4rnds4	ymm30, ymm29, [r9]
	vsm4rnds4	ymm30, ymm29, YMMWORD PTR [rcx+4064]
	vsm4rnds4	ymm30, ymm29, YMMWORD PTR [rdx-4096]
	vsm4rnds4	xmm30, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vsm4rnds4	xmm30, xmm29, XMMWORD PTR [r9]
	vsm4rnds4	xmm30, xmm29, [rcx+2032]
	vsm4rnds4	xmm30, xmm29, [rdx-2048]
