# Check 64bit AVX10.2/512 instructions

	.arch generic64
	.arch .avx10.2/512
	.text
_start:
	.irp u, "", u
	vcvtbf162i\u\()bs	%zmm29, %zmm30
	vcvtbf162i\u\()bs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvtbf162i\u\()bs	(%r9){1to32}, %zmm30
	vcvtbf162i\u\()bs	8128(%rcx), %zmm30
	vcvtbf162i\u\()bs	-256(%rdx){1to32}, %zmm30{%k7}{z}

	vcvtph2i\u\()bs	%zmm29, %zmm30
	vcvtph2i\u\()bs	{rn-sae}, %zmm29, %zmm30
	vcvtph2i\u\()bs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvtph2i\u\()bs	(%r9){1to32}, %zmm30
	vcvtph2i\u\()bs	8128(%rcx), %zmm30
	vcvtph2i\u\()bs	-256(%rdx){1to32}, %zmm30{%k7}{z}

	vcvtps2i\u\()bs	%zmm29, %zmm30
	vcvtps2i\u\()bs	{rn-sae}, %zmm29, %zmm30
	vcvtps2i\u\()bs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvtps2i\u\()bs	(%r9){1to16}, %zmm30
	vcvtps2i\u\()bs	8128(%rcx), %zmm30
	vcvtps2i\u\()bs	-512(%rdx){1to16}, %zmm30{%k7}{z}

	vcvttbf162i\u\()bs	%zmm29, %zmm30
	vcvttbf162i\u\()bs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvttbf162i\u\()bs	(%r9){1to32}, %zmm30
	vcvttbf162i\u\()bs	8128(%rcx), %zmm30
	vcvttbf162i\u\()bs	-256(%rdx){1to32}, %zmm30{%k7}{z}

	vcvttph2i\u\()bs	%zmm29, %zmm30
	vcvttph2i\u\()bs	{sae}, %zmm29, %zmm30
	vcvttph2i\u\()bs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvttph2i\u\()bs	(%r9){1to32}, %zmm30
	vcvttph2i\u\()bs	8128(%rcx), %zmm30
	vcvttph2i\u\()bs	-256(%rdx){1to32}, %zmm30{%k7}{z}

	vcvttps2i\u\()bs	%zmm29, %zmm30
	vcvttps2i\u\()bs	{sae}, %zmm29, %zmm30
	vcvttps2i\u\()bs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvttps2i\u\()bs	(%r9){1to16}, %zmm30
	vcvttps2i\u\()bs	8128(%rcx), %zmm30
	vcvttps2i\u\()bs	-512(%rdx){1to16}, %zmm30{%k7}{z}

	vcvttpd2\u\()dqs	%zmm29, %ymm30
	vcvttpd2\u\()dqs	{sae}, %zmm29, %ymm30
	vcvttpd2\u\()dqs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvttpd2\u\()dqs	(%r9){1to8}, %ymm30
	vcvttpd2\u\()dqs	8128(%rcx), %ymm30
	vcvttpd2\u\()dqs	-1024(%rdx){1to8}, %ymm30{%k7}{z}

	vcvttpd2\u\()qqs	%zmm29, %zmm30
	vcvttpd2\u\()qqs	{sae}, %zmm29, %zmm30
	vcvttpd2\u\()qqs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvttpd2\u\()qqs	(%r9){1to8}, %zmm30
	vcvttpd2\u\()qqs	8128(%rcx), %zmm30
	vcvttpd2\u\()qqs	-1024(%rdx){1to8}, %zmm30{%k7}{z}

	vcvttps2\u\()dqs	%zmm29, %zmm30
	vcvttps2\u\()dqs	{sae}, %zmm29, %zmm30
	vcvttps2\u\()dqs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvttps2\u\()dqs	(%r9){1to16}, %zmm30
	vcvttps2\u\()dqs	8128(%rcx), %zmm30
	vcvttps2\u\()dqs	-512(%rdx){1to16}, %zmm30{%k7}{z}

	vcvttps2\u\()qqs	%ymm29, %zmm30
	vcvttps2\u\()qqs	{sae}, %ymm29, %zmm30
	vcvttps2\u\()qqs	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vcvttps2\u\()qqs	(%r9){1to8}, %zmm30
	vcvttps2\u\()qqs	4064(%rcx), %zmm30
	vcvttps2\u\()qqs	-512(%rdx){1to8}, %zmm30{%k7}{z}
	.endr

_intel:
	.intel_syntax noprefix
	.irp u, "", u
	vcvtbf162i\u\()bs	zmm30, zmm29
	vcvtbf162i\u\()bs	zmm30{k7}, [rbp+r14*8+0x10000000]
	vcvtbf162i\u\()bs	zmm30, [r9]{1to32}
	vcvtbf162i\u\()bs	zmm30, ZMMWORD PTR [rcx+8128]
	vcvtbf162i\u\()bs	zmm30{k7}{z}, WORD PTR [rdx-256]{1to32}

	vcvtph2i\u\()bs	zmm30, zmm29
	vcvtph2i\u\()bs	zmm30, zmm29, {rn-sae}
	vcvtph2i\u\()bs	zmm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtph2i\u\()bs	zmm30, WORD PTR [r9]{1to32}
	vcvtph2i\u\()bs	zmm30, [rcx+8128]
	vcvtph2i\u\()bs	zmm30{k7}{z}, [rdx-256]{1to32}

	vcvtps2i\u\()bs	zmm30, zmm29
	vcvtps2i\u\()bs	zmm30, zmm29, {rn-sae}
	vcvtps2i\u\()bs	zmm30{k7}, [rbp+r14*8+0x10000000]
	vcvtps2i\u\()bs	zmm30, DWORD PTR [r9]{1to16}
	vcvtps2i\u\()bs	zmm30, ZMMWORD PTR [rcx+8128]
	vcvtps2i\u\()bs	zmm30{k7}{z}, [rdx-512]{1to16}

	vcvttbf162i\u\()bs	zmm30, zmm29
	vcvttbf162i\u\()bs	zmm30{k7}, [rbp+r14*8+0x10000000]
	vcvttbf162i\u\()bs	zmm30, [r9]{1to32}
	vcvttbf162i\u\()bs	zmm30, ZMMWORD PTR [rcx+8128]
	vcvttbf162i\u\()bs	zmm30{k7}{z}, WORD PTR [rdx-256]{1to32}

	vcvttph2i\u\()bs	zmm30, zmm29
	vcvttph2i\u\()bs	zmm30, zmm29, {sae}
	vcvttph2i\u\()bs	zmm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttph2i\u\()bs	zmm30, [r9]{1to32}
	vcvttph2i\u\()bs	zmm30, [rcx+8128]
	vcvttph2i\u\()bs	zmm30{k7}{z}, WORD PTR [rdx-256]{1to32}

	vcvttps2i\u\()bs	zmm30, zmm29
	vcvttps2i\u\()bs	zmm30, zmm29, {sae}
	vcvttps2i\u\()bs	zmm30{k7}, [rbp+r14*8+0x10000000]
	vcvttps2i\u\()bs	zmm30, [r9]{1to16}
	vcvttps2i\u\()bs	zmm30, ZMMWORD PTR [rcx+8128]
	vcvttps2i\u\()bs	zmm30{k7}{z}, DWORD PTR [rdx-512]{1to16}

	vcvttpd2\u\()dqs	ymm30, zmm29
	vcvttpd2\u\()dqs	ymm30, zmm29, {sae}
	vcvttpd2\u\()dqs	ymm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttpd2\u\()dqs	ymm30, QWORD PTR [r9]{1to8}
	vcvttpd2\u\()dqs	ymm30, [rcx+8128]
	vcvttpd2\u\()dqs	ymm30{k7}{z}, [rdx-1024]{1to8}

	vcvttpd2\u\()qqs	zmm30, zmm29
	vcvttpd2\u\()qqs	zmm30, zmm29, {sae}
	vcvttpd2\u\()qqs	zmm30{k7}, [rbp+r14*8+0x10000000]
	vcvttpd2\u\()qqs	zmm30, [r9]{1to8}
	vcvttpd2\u\()qqs	zmm30, ZMMWORD PTR [rcx+8128]
	vcvttpd2\u\()qqs	zmm30{k7}{z}, QWORD PTR [rdx-1024]{1to8}

	vcvttps2\u\()dqs	zmm30, zmm29
	vcvttps2\u\()dqs	zmm30, zmm29, {sae}
	vcvttps2\u\()dqs	zmm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttps2\u\()dqs	zmm30, DWORD PTR [r9]{1to16}
	vcvttps2\u\()dqs	zmm30, [rcx+8128]
	vcvttps2\u\()dqs	zmm30{k7}{z}, [rdx-512]{1to16}

	vcvttps2\u\()qqs	zmm30, ymm29
	vcvttps2\u\()qqs	zmm30, ymm29, {sae}
	vcvttps2\u\()qqs	zmm30{k7}, [rbp+r14*8+0x10000000]
	vcvttps2\u\()qqs	zmm30, [r9]{1to8}
	vcvttps2\u\()qqs	zmm30, YMMWORD PTR [rcx+4064]
	vcvttps2\u\()qqs	zmm30{k7}{z}, DWORD PTR [rdx-512]{1to8}
	.endr
