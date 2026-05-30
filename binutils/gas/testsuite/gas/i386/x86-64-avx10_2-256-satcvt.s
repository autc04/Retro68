# Check 64bit AVX10.2/256 instructions

	.arch generic64
	.arch .avx10.2/256
	.text
_start:
	.irp u, "", u
	vcvtbf162i\u\()bs	%xmm29, %xmm30
	vcvtbf162i\u\()bs	%ymm29, %ymm30
	vcvtbf162i\u\()bs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvtbf162i\u\()bs	(%r9){1to8}, %xmm30
	vcvtbf162i\u\()bs	2032(%rcx), %xmm30
	vcvtbf162i\u\()bs	-256(%rdx){1to8}, %xmm30{%k7}{z}
	vcvtbf162i\u\()bs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvtbf162i\u\()bs	(%r9){1to16}, %ymm30
	vcvtbf162i\u\()bs	4064(%rcx), %ymm30
	vcvtbf162i\u\()bs	-256(%rdx){1to16}, %ymm30{%k7}{z}

	vcvtph2i\u\()bs	%xmm29, %xmm30
	vcvtph2i\u\()bs	%ymm29, %ymm30
	vcvtph2i\u\()bs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvtph2i\u\()bs	(%r9){1to8}, %xmm30
	vcvtph2i\u\()bs	2032(%rcx), %xmm30
	vcvtph2i\u\()bs	-256(%rdx){1to8}, %xmm30{%k7}{z}
	vcvtph2i\u\()bs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvtph2i\u\()bs	(%r9){1to16}, %ymm30
	vcvtph2i\u\()bs	4064(%rcx), %ymm30
	vcvtph2i\u\()bs	-256(%rdx){1to16}, %ymm30{%k7}{z}

	vcvtps2i\u\()bs	%xmm29, %xmm30
	vcvtps2i\u\()bs	%ymm29, %ymm30
	vcvtps2i\u\()bs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvtps2i\u\()bs	(%r9){1to4}, %xmm30
	vcvtps2i\u\()bs	2032(%rcx), %xmm30
	vcvtps2i\u\()bs	-512(%rdx){1to4}, %xmm30{%k7}{z}
	vcvtps2i\u\()bs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvtps2i\u\()bs	(%r9){1to8}, %ymm30
	vcvtps2i\u\()bs	4064(%rcx), %ymm30
	vcvtps2i\u\()bs	-512(%rdx){1to8}, %ymm30{%k7}{z}

	vcvttbf162i\u\()bs	%xmm29, %xmm30
	vcvttbf162i\u\()bs	%ymm29, %ymm30
	vcvttbf162i\u\()bs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvttbf162i\u\()bs	(%r9){1to8}, %xmm30
	vcvttbf162i\u\()bs	2032(%rcx), %xmm30
	vcvttbf162i\u\()bs	-256(%rdx){1to8}, %xmm30{%k7}{z}
	vcvttbf162i\u\()bs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvttbf162i\u\()bs	(%r9){1to16}, %ymm30
	vcvttbf162i\u\()bs	4064(%rcx), %ymm30
	vcvttbf162i\u\()bs	-256(%rdx){1to16}, %ymm30{%k7}{z}

	vcvttph2i\u\()bs	%xmm29, %xmm30
	vcvttph2i\u\()bs	%ymm29, %ymm30
	vcvttph2i\u\()bs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvttph2i\u\()bs	(%r9){1to8}, %xmm30
	vcvttph2i\u\()bs	2032(%rcx), %xmm30
	vcvttph2i\u\()bs	-256(%rdx){1to8}, %xmm30{%k7}{z}
	vcvttph2i\u\()bs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvttph2i\u\()bs	(%r9){1to16}, %ymm30
	vcvttph2i\u\()bs	4064(%rcx), %ymm30
	vcvttph2i\u\()bs	-256(%rdx){1to16}, %ymm30{%k7}{z}

	vcvttps2i\u\()bs	%xmm29, %xmm30
	vcvttps2i\u\()bs	%ymm29, %ymm30
	vcvttps2i\u\()bs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvttps2i\u\()bs	(%r9){1to4}, %xmm30
	vcvttps2i\u\()bs	2032(%rcx), %xmm30
	vcvttps2i\u\()bs	-512(%rdx){1to4}, %xmm30{%k7}{z}
	vcvttps2i\u\()bs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvttps2i\u\()bs	(%r9){1to8}, %ymm30
	vcvttps2i\u\()bs	4064(%rcx), %ymm30
	vcvttps2i\u\()bs	-512(%rdx){1to8}, %ymm30{%k7}{z}

	vcvttpd2\u\()dqs	%xmm29, %xmm30
	vcvttpd2\u\()dqs	%ymm29, %xmm30
	vcvttpd2\u\()dqsx	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvttpd2\u\()dqs	(%r9){1to2}, %xmm30
	vcvttpd2\u\()dqsx	2032(%rcx), %xmm30
	vcvttpd2\u\()dqs	-1024(%rdx){1to2}, %xmm30{%k7}{z}
	vcvttpd2\u\()dqs	(%r9){1to4}, %xmm30
	vcvttpd2\u\()dqsy	4064(%rcx), %xmm30
	vcvttpd2\u\()dqs	-1024(%rdx){1to4}, %xmm30{%k7}{z}

	vcvttpd2\u\()qqs	%xmm29, %xmm30
	vcvttpd2\u\()qqs	%ymm29, %ymm30
	vcvttpd2\u\()qqs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvttpd2\u\()qqs	(%r9){1to2}, %xmm30
	vcvttpd2\u\()qqs	2032(%rcx), %xmm30
	vcvttpd2\u\()qqs	-1024(%rdx){1to2}, %xmm30{%k7}{z}
	vcvttpd2\u\()qqs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvttpd2\u\()qqs	(%r9){1to4}, %ymm30
	vcvttpd2\u\()qqs	4064(%rcx), %ymm30
	vcvttpd2\u\()qqs	-1024(%rdx){1to4}, %ymm30{%k7}{z}

	vcvttps2\u\()dqs	%xmm29, %xmm30
	vcvttps2\u\()dqs	%ymm29, %ymm30
	vcvttps2\u\()dqs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvttps2\u\()dqs	(%r9){1to4}, %xmm30
	vcvttps2\u\()dqs	2032(%rcx), %xmm30
	vcvttps2\u\()dqs	-512(%rdx){1to4}, %xmm30{%k7}{z}
	vcvttps2\u\()dqs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvttps2\u\()dqs	(%r9){1to8}, %ymm30
	vcvttps2\u\()dqs	4064(%rcx), %ymm30
	vcvttps2\u\()dqs	-512(%rdx){1to8}, %ymm30{%k7}{z}

	vcvttps2\u\()qqs	%xmm29, %xmm30
	vcvttps2\u\()qqs	%xmm29, %ymm30
	vcvttps2\u\()qqs	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vcvttps2\u\()qqs	(%r9){1to2}, %xmm30
	vcvttps2\u\()qqs	1016(%rcx), %xmm30
	vcvttps2\u\()qqs	-512(%rdx){1to2}, %xmm30{%k7}{z}
	vcvttps2\u\()qqs	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	vcvttps2\u\()qqs	(%r9){1to4}, %ymm30
	vcvttps2\u\()qqs	2032(%rcx), %ymm30
	vcvttps2\u\()qqs	-512(%rdx){1to4}, %ymm30{%k7}{z}

	vcvttsd2\u\()sis	%xmm30, %edx
	vcvttsd2\u\()sis	{sae}, %xmm30, %edx
	vcvttsd2\u\()sis	%xmm30, %r12
	vcvttsd2\u\()sis	{sae}, %xmm30, %r12
	vcvttsd2\u\()sis	0x10000000(%rbp, %r14, 8), %edx
	vcvttsd2\u\()sis	(%r9), %edx
	vcvttsd2\u\()sis	1016(%rcx), %edx
	vcvttsd2\u\()sis	-1024(%rdx), %edx
	vcvttsd2\u\()sis	0x10000000(%rbp, %r14, 8), %r12
	vcvttsd2\u\()sis	(%r9), %r12
	vcvttsd2\u\()sis	1016(%rcx), %r12
	vcvttsd2\u\()sis	-1024(%rdx), %r12

	vcvttss2\u\()sis	%xmm30, %edx
	vcvttss2\u\()sis	{sae}, %xmm30, %edx
	vcvttss2\u\()sis	%xmm30, %r12
	vcvttss2\u\()sis	{sae}, %xmm30, %r12
	vcvttss2\u\()sis	0x10000000(%rbp, %r14, 8), %edx
	vcvttss2\u\()sis	(%r9), %edx
	vcvttss2\u\()sis	508(%rcx), %edx
	vcvttss2\u\()sis	-512(%rdx), %edx
	vcvttss2\u\()sis	0x10000000(%rbp, %r14, 8), %r12
	vcvttss2\u\()sis	(%r9), %r12
	vcvttss2\u\()sis	508(%rcx), %r12
	vcvttss2\u\()sis	-512(%rdx), %r12
	.endr

_intel:
	.intel_syntax noprefix
	.irp u, "", u
	vcvtbf162i\u\()bs	xmm30, xmm29
	vcvtbf162i\u\()bs	ymm30, ymm29
	vcvtbf162i\u\()bs	xmm30{k7}, [rbp+r14*8+0x10000000]
	vcvtbf162i\u\()bs	xmm30, [r9]{1to8}
	vcvtbf162i\u\()bs	xmm30, XMMWORD PTR [rcx+2032]
	vcvtbf162i\u\()bs	xmm30{k7}{z}, WORD PTR [rdx-256]{1to8}
	vcvtbf162i\u\()bs	ymm30{k7}, [rbp+r14*8+0x10000000]
	vcvtbf162i\u\()bs	ymm30, [r9]{1to16}
	vcvtbf162i\u\()bs	ymm30, YMMWORD PTR [rcx+4064]
	vcvtbf162i\u\()bs	ymm30{k7}{z}, WORD PTR [rdx-256]{1to16}

	vcvtph2i\u\()bs	xmm30, xmm29
	vcvtph2i\u\()bs	ymm30, ymm29
	vcvtph2i\u\()bs	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtph2i\u\()bs	xmm30, WORD PTR [r9]{1to8}
	vcvtph2i\u\()bs	xmm30, [rcx+2032]
	vcvtph2i\u\()bs	xmm30{k7}{z}, [rdx-256]{1to8}
	vcvtph2i\u\()bs	ymm30{k7}, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtph2i\u\()bs	ymm30, WORD PTR [r9]{1to16}
	vcvtph2i\u\()bs	ymm30, [rcx+4064]
	vcvtph2i\u\()bs	ymm30{k7}{z}, [rdx-256]{1to16}

	vcvtps2i\u\()bs	xmm30, xmm29
	vcvtps2i\u\()bs	ymm30, ymm29
	vcvtps2i\u\()bs	xmm30{k7}, [rbp+r14*8+0x10000000]
	vcvtps2i\u\()bs	xmm30, [r9]{1to4}
	vcvtps2i\u\()bs	xmm30, XMMWORD PTR [rcx+2032]
	vcvtps2i\u\()bs	xmm30{k7}{z}, DWORD PTR [rdx-512]{1to4}
	vcvtps2i\u\()bs	ymm30{k7}, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvtps2i\u\()bs	ymm30, DWORD PTR [r9]{1to8}
	vcvtps2i\u\()bs	ymm30, [rcx+4064]
	vcvtps2i\u\()bs	ymm30{k7}{z}, [rdx-512]{1to8}

	vcvttbf162i\u\()bs	xmm30, xmm29
	vcvttbf162i\u\()bs	ymm30, ymm29
	vcvttbf162i\u\()bs	xmm30{k7}, [rbp+r14*8+0x10000000]
	vcvttbf162i\u\()bs	xmm30, [r9]{1to8}
	vcvttbf162i\u\()bs	xmm30, XMMWORD PTR [rcx+2032]
	vcvttbf162i\u\()bs	xmm30{k7}{z}, WORD PTR [rdx-256]{1to8}
	vcvttbf162i\u\()bs	ymm30{k7}, [rbp+r14*8+0x10000000]
	vcvttbf162i\u\()bs	ymm30, [r9]{1to16}
	vcvttbf162i\u\()bs	ymm30, YMMWORD PTR [rcx+4064]
	vcvttbf162i\u\()bs	ymm30{k7}{z}, WORD PTR [rdx-256]{1to16}

	vcvttph2i\u\()bs	xmm30, xmm29
	vcvttph2i\u\()bs	ymm30, ymm29
	vcvttph2i\u\()bs	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttph2i\u\()bs	xmm30, WORD PTR [r9]{1to8}
	vcvttph2i\u\()bs	xmm30, [rcx+2032]
	vcvttph2i\u\()bs	xmm30{k7}{z}, [rdx-256]{1to8}
	vcvttph2i\u\()bs	ymm30{k7}, [rbp+r14*8+0x10000000]
	vcvttph2i\u\()bs	ymm30, [r9]{1to16}
	vcvttph2i\u\()bs	ymm30, YMMWORD PTR [rcx+4064]
	vcvttph2i\u\()bs	ymm30{k7}{z}, WORD PTR [rdx-256]{1to16}

	vcvttps2i\u\()bs	xmm30, xmm29
	vcvttps2i\u\()bs	ymm30, ymm29
	vcvttps2i\u\()bs	xmm30{k7}, [rbp+r14*8+0x10000000]
	vcvttps2i\u\()bs	xmm30, [r9]{1to4}
	vcvttps2i\u\()bs	xmm30, XMMWORD PTR [rcx+2032]
	vcvttps2i\u\()bs	xmm30{k7}{z}, DWORD PTR [rdx-512]{1to4}
	vcvttps2i\u\()bs	ymm30{k7}, [rbp+r14*8+0x10000000]
	vcvttps2i\u\()bs	ymm30, [r9]{1to8}
	vcvttps2i\u\()bs	ymm30, YMMWORD PTR [rcx+4064]
	vcvttps2i\u\()bs	ymm30{k7}{z}, DWORD PTR [rdx-512]{1to8}

	vcvttpd2\u\()dqs	xmm30, xmm29
	vcvttpd2\u\()dqs	xmm30, ymm29
	vcvttpd2\u\()dqs	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttpd2\u\()dqs	xmm30, QWORD PTR [r9]{1to2}
	vcvttpd2\u\()dqs	xmm30, XMMWORD PTR [rcx+2032]
	vcvttpd2\u\()dqs	xmm30{k7}{z}, [rdx-1024]{1to2}
	vcvttpd2\u\()dqs	xmm30, QWORD PTR [r9]{1to4}
	vcvttpd2\u\()dqs	xmm30, YMMWORD PTR [rcx+4064]
	vcvttpd2\u\()dqs	xmm30{k7}{z}, [rdx-1024]{1to4}

	vcvttpd2\u\()qqs	xmm30, xmm29
	vcvttpd2\u\()qqs	ymm30, ymm29
	vcvttpd2\u\()qqs	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttpd2\u\()qqs	xmm30, [r9]{1to2}
	vcvttpd2\u\()qqs	xmm30, [rcx+2032]
	vcvttpd2\u\()qqs	xmm30{k7}{z}, QWORD PTR [rdx-1024]{1to2}
	vcvttpd2\u\()qqs	ymm30{k7}, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttpd2\u\()qqs	ymm30, QWORD PTR [r9]{1to4}
	vcvttpd2\u\()qqs	ymm30, [rcx+4064]
	vcvttpd2\u\()qqs	ymm30{k7}{z}, [rdx-1024]{1to4}

	vcvttps2\u\()dqs	xmm30, xmm29
	vcvttps2\u\()dqs	ymm30, ymm29
	vcvttps2\u\()dqs	xmm30{k7}, [rbp+r14*8+0x10000000]
	vcvttps2\u\()dqs	xmm30, DWORD PTR [r9]{1to4}
	vcvttps2\u\()dqs	xmm30, XMMWORD PTR [rcx+2032]
	vcvttps2\u\()dqs	xmm30{k7}{z}, [rdx-512]{1to4}
	vcvttps2\u\()dqs	ymm30{k7}, YMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttps2\u\()dqs	ymm30, [r9]{1to8}
	vcvttps2\u\()dqs	ymm30, [rcx+4064]
	vcvttps2\u\()dqs	ymm30{k7}{z}, DWORD PTR [rdx-512]{1to8}

	vcvttps2\u\()qqs	xmm30, xmm29
	vcvttps2\u\()qqs	ymm30, xmm29
	vcvttps2\u\()qqs	xmm30{k7}, QWORD PTR [rbp+r14*8+0x10000000]
	vcvttps2\u\()qqs	xmm30, [r9]{1to2}
	vcvttps2\u\()qqs	xmm30, QWORD PTR [rcx+1016]
	vcvttps2\u\()qqs	xmm30{k7}{z}, DWORD PTR [rdx-512]{1to2}
	vcvttps2\u\()qqs	ymm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vcvttps2\u\()qqs	ymm30, [r9]{1to4}
	vcvttps2\u\()qqs	ymm30, XMMWORD PTR [rcx+2032]
	vcvttps2\u\()qqs	ymm30{k7}{z}, DWORD PTR [rdx-512]{1to4}

	vcvttsd2\u\()sis	edx, xmm30
	vcvttsd2\u\()sis	edx, xmm30, {sae}
	vcvttsd2\u\()sis	r12, xmm30
	vcvttsd2\u\()sis	r12, xmm30, {sae}
	vcvttsd2\u\()sis	edx, QWORD PTR [rbp+r14*8+0x10000000]
	vcvttsd2\u\()sis	edx, [r9]
	vcvttsd2\u\()sis	edx, QWORD PTR [rcx+1016]
	vcvttsd2\u\()sis	edx, [rdx-1024]
	vcvttsd2\u\()sis	r12, [rbp+r14*8+0x10000000]
	vcvttsd2\u\()sis	r12, QWORD PTR [r9]
	vcvttsd2\u\()sis	r12, [rcx+1016]
	vcvttsd2\u\()sis	r12, QWORD PTR [rdx-1024]

	vcvttss2\u\()sis	edx, xmm30
	vcvttss2\u\()sis	edx, xmm30, {sae}
	vcvttss2\u\()sis	r12, xmm30
	vcvttss2\u\()sis	r12, xmm30, {sae}
	vcvttss2\u\()sis	edx, [rbp+r14*8+0x10000000]
	vcvttss2\u\()sis	edx, DWORD PTR [r9]
	vcvttss2\u\()sis	edx, [rcx+508]
	vcvttss2\u\()sis	edx, DWORD PTR [rdx-512]
	vcvttss2\u\()sis	r12, DWORD PTR [rbp+r14*8+0x10000000]
	vcvttss2\u\()sis	r12, [r9]
	vcvttss2\u\()sis	r12, DWORD PTR [rcx+508]
	vcvttss2\u\()sis	r12, [rdx-512]
	.endr
