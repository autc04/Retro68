# Check 64bit AVX10.2/256 instructions

	.arch generic64
	.arch .avx10.2/256
	.text
_start:
	vcvt2ps2phx	%xmm28, %xmm29, %xmm30
	vcvt2ps2phx	%ymm28, %ymm29, %ymm30
	vcvt2ps2phx	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vcvt2ps2phx	(%r9){1to4}, %xmm29, %xmm30
	vcvt2ps2phx	2032(%rcx), %xmm29, %xmm30
	vcvt2ps2phx	-512(%rdx){1to4}, %xmm29, %xmm30{%k7}
	vcvt2ps2phx	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vcvt2ps2phx	(%r9){1to8}, %ymm29, %ymm30
	vcvt2ps2phx	4064(%rcx), %ymm29, %ymm30
	vcvt2ps2phx	-512(%rdx){1to8}, %ymm29, %ymm30{%k7}

	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	%xmm28, %xmm29, %xmm30
	vcvtbiasph2\m	%ymm28, %ymm29, %xmm30
	vcvtbiasph2\m	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vcvtbiasph2\m	(%r9){1to8}, %xmm29, %xmm30
	vcvtbiasph2\m	2032(%rcx), %xmm29, %xmm30
	vcvtbiasph2\m	-256(%rdx){1to8}, %xmm29, %xmm30{%k7}{z}
	vcvtbiasph2\m	0x10000000(%rbp, %r14, 8), %ymm29, %xmm30{%k7}
	vcvtbiasph2\m	(%r9){1to16}, %ymm29, %xmm30
	vcvtbiasph2\m	4064(%rcx), %ymm29, %xmm30
	vcvtbiasph2\m	-256(%rdx){1to16}, %ymm29, %xmm30{%k7}{z}
	vcvt2ph2\m	%xmm28, %xmm29, %xmm30
	vcvt2ph2\m	%ymm28, %ymm29, %ymm30
	vcvt2ph2\m	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vcvt2ph2\m	(%r9){1to8}, %xmm29, %xmm30
	vcvt2ph2\m	2032(%rcx), %xmm29, %xmm30
	vcvt2ph2\m	-256(%rdx){1to8}, %xmm29, %xmm30{%k7}
	vcvt2ph2\m	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vcvt2ph2\m	(%r9){1to16}, %ymm29, %ymm30
	vcvt2ph2\m	4064(%rcx), %ymm29, %ymm30
	vcvt2ph2\m	-256(%rdx){1to16}, %ymm29, %ymm30{%k7}
	vcvtph2\m	%xmm29, %xmm30
	vcvtph2\m	%ymm29, %xmm30
	vcvtph2\m\()x	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvtph2\m	(%r9){1to8}, %xmm30
	vcvtph2\m\()x	2032(%rcx), %xmm30
	vcvtph2\m	-256(%rdx){1to8}, %xmm30{%k7}{z}
	vcvtph2\m	(%r9){1to16}, %xmm30
	vcvtph2\m\()y	4064(%rcx), %xmm30
	vcvtph2\m	-256(%rdx){1to16}, %xmm30{%k7}{z}
	.endr

	vcvthf82ph	%xmm29, %xmm30
	vcvthf82ph	%xmm29, %ymm30
	vcvthf82ph	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvthf82ph	(%r9), %xmm30
	vcvthf82ph	1016(%rcx), %xmm30
	vcvthf82ph	-1024(%rdx), %xmm30{%k7}{z}
	vcvthf82ph	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvthf82ph	(%r9), %ymm30
	vcvthf82ph	2032(%rcx), %ymm30
	vcvthf82ph	-2048(%rdx), %ymm30{%k7}{z}

_intel:
	.intel_syntax noprefix
	vcvt2ps2phx	xmm30, xmm29, xmm28
	vcvt2ps2phx	ymm30, ymm29, ymm28
	vcvt2ps2phx	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvt2ps2phx	xmm30, xmm29, DWORD PTR [r9]{1to4}
	vcvt2ps2phx	xmm30, xmm29, XMMWORD PTR [rcx+2032]
	vcvt2ps2phx	xmm30{k7}, xmm29, DWORD PTR [rdx-512]{1to4}
	vcvt2ps2phx	ymm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvt2ps2phx	ymm30, ymm29, DWORD PTR [r9]{1to8}
	vcvt2ps2phx	ymm30, ymm29, YMMWORD PTR [rcx+4064]
	vcvt2ps2phx	ymm30{k7}, ymm29, DWORD PTR [rdx-512]{1to8}

	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	xmm30, xmm29, xmm28
	vcvtbiasph2\m	xmm30, ymm29, ymm28
	vcvtbiasph2\m	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtbiasph2\m	xmm30, xmm29, WORD PTR [r9]{1to8}
	vcvtbiasph2\m	xmm30, xmm29, XMMWORD PTR [rcx+2032]
	vcvtbiasph2\m	xmm30{k7}{z}, xmm29, WORD PTR [rdx-256]{1to8}
	vcvtbiasph2\m	xmm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtbiasph2\m	xmm30, ymm29, WORD PTR [r9]{1to16}
	vcvtbiasph2\m	xmm30, ymm29, YMMWORD PTR [rcx+4064]
	vcvtbiasph2\m	xmm30{k7}{z}, ymm29, WORD PTR [rdx-256]{1to16}
	vcvt2ph2\m	xmm30, xmm29, xmm28
	vcvt2ph2\m	ymm30, ymm29, ymm28
	vcvt2ph2\m	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvt2ph2\m	xmm30, xmm29, WORD PTR [r9]{1to8}
	vcvt2ph2\m	xmm30, xmm29, XMMWORD PTR [rcx+2032]
	vcvt2ph2\m	xmm30{k7}, xmm29, WORD PTR [rdx-256]{1to8}
	vcvt2ph2\m	ymm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvt2ph2\m	ymm30, ymm29, WORD PTR [r9]{1to16}
	vcvt2ph2\m	ymm30, ymm29, YMMWORD PTR [rcx+4064]
	vcvt2ph2\m	ymm30{k7}, ymm29, WORD PTR [rdx-256]{1to16}
	vcvtph2\m	xmm30, xmm29
	vcvtph2\m	xmm30, ymm29
	vcvtph2\m	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtph2\m	xmm30, WORD PTR [r9]{1to8}
	vcvtph2\m	xmm30, XMMWORD PTR [rcx+2032]
	vcvtph2\m	xmm30{k7}{z}, WORD PTR [rdx-256]{1to8}
	vcvtph2\m	xmm30, WORD PTR [r9]{1to16}
	vcvtph2\m	xmm30, YMMWORD PTR [rcx+4064]
	vcvtph2\m	xmm30{k7}{z}, WORD PTR [rdx-256]{1to16}
	.endr

	vcvthf82ph	xmm30, xmm29
	vcvthf82ph	ymm30, xmm29
	vcvthf82ph	xmm30{k7}, QWORD PTR [rbp+r14*8+0x10000000]
	vcvthf82ph	xmm30, QWORD PTR [r9]
	vcvthf82ph	xmm30, QWORD PTR [rcx+1016]
	vcvthf82ph	xmm30{k7}{z}, QWORD PTR [rdx-1024]
	vcvthf82ph	ymm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvthf82ph	ymm30, XMMWORD PTR [r9]
	vcvthf82ph	ymm30, XMMWORD PTR [rcx+2032]
	vcvthf82ph	ymm30{k7}{z}, XMMWORD PTR [rdx-2048]
