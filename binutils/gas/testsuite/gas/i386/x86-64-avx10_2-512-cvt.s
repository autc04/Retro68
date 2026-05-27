# Check 64bit AVX10.2/512 instructions

	.arch generic64
	.arch .avx10.2/512
	.text
_start:
	vcvt2ps2phx	%zmm28, %zmm29, %zmm30
	vcvt2ps2phx	{rn-sae}, %zmm28, %zmm29, %zmm30
	vcvt2ps2phx	0x10000000(%rbp, %r14, 8), %zmm29, %zmm30{%k7}
	vcvt2ps2phx	(%r9){1to16}, %zmm29, %zmm30
	vcvt2ps2phx	8128(%rcx), %zmm29, %zmm30
	vcvt2ps2phx	-512(%rdx){1to16}, %zmm29, %zmm30{%k7}

	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	%zmm28, %zmm29, %ymm30
	vcvtbiasph2\m	0x10000000(%rbp, %r14, 8), %zmm29, %ymm30{%k7}
	vcvtbiasph2\m	(%r9){1to32}, %zmm29, %ymm30
	vcvtbiasph2\m	8128(%rcx), %zmm29, %ymm30
	vcvtbiasph2\m	-256(%rdx){1to32}, %zmm29, %ymm30{%k7}{z}
	vcvt2ph2\m	%zmm28, %zmm29, %zmm30
	vcvt2ph2\m	0x10000000(%rbp, %r14, 8), %zmm29, %zmm30{%k7}
	vcvt2ph2\m	(%r9){1to32}, %zmm29, %zmm30
	vcvt2ph2\m	8128(%rcx), %zmm29, %zmm30
	vcvt2ph2\m	-256(%rdx){1to32}, %zmm29, %zmm30{%k7}
	vcvtph2\m	%zmm29, %ymm30
	vcvtph2\m	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvtph2\m	(%r9){1to32}, %ymm30
	vcvtph2\m	8128(%rcx), %ymm30
	vcvtph2\m	-256(%rdx){1to32}, %ymm30{%k7}{z}
	.endr

	vcvthf82ph	%ymm29, %zmm30
	vcvthf82ph	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvthf82ph	(%r9), %zmm30
	vcvthf82ph	4064(%rcx), %zmm30
	vcvthf82ph	-4096(%rdx), %zmm30{%k7}{z}

_intel:
	.intel_syntax noprefix
	vcvt2ps2phx	zmm30, zmm29, zmm28
	vcvt2ps2phx	zmm30, zmm29, zmm28, {rn-sae}
	vcvt2ps2phx	zmm30{k7}, zmm29, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvt2ps2phx	zmm30, zmm29, DWORD PTR [r9]{1to16}
	vcvt2ps2phx	zmm30, zmm29, ZMMWORD PTR [rcx+8128]
	vcvt2ps2phx	zmm30{k7}, zmm29, DWORD PTR [rdx-512]{1to16}

	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	ymm30, zmm29, zmm28
	vcvtbiasph2\m	ymm30{k7}, zmm29, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtbiasph2\m	ymm30, zmm29, WORD PTR [r9]{1to32}
	vcvtbiasph2\m	ymm30, zmm29, ZMMWORD PTR [rcx+8128]
	vcvtbiasph2\m	ymm30{k7}{z}, zmm29, WORD PTR [rdx-256]{1to32}
	vcvt2ph2\m	zmm30, zmm29, zmm28
	vcvt2ph2\m	zmm30{k7}, zmm29, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvt2ph2\m	zmm30, zmm29, WORD PTR [r9]{1to32}
	vcvt2ph2\m	zmm30, zmm29, ZMMWORD PTR [rcx+8128]
	vcvt2ph2\m	zmm30{k7}, zmm29, WORD PTR [rdx-256]{1to32}
	vcvtph2\m	ymm30, zmm29
	vcvtph2\m	ymm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtph2\m	ymm30, WORD PTR [r9]{1to32}
	vcvtph2\m	ymm30, ZMMWORD PTR [rcx+8128]
	vcvtph2\m	ymm30{k7}{z}, WORD PTR [rdx-256]{1to32}
	.endr

	vcvthf82ph	zmm30, ymm29
	vcvthf82ph	zmm30{k7}, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvthf82ph	zmm30, YMMWORD PTR [r9]
	vcvthf82ph	zmm30, YMMWORD PTR [rcx+4064]
	vcvthf82ph	zmm30{k7}{z}, YMMWORD PTR [rdx-4096]
