# Check 32bit AVX10.2/256 instructions

	.arch generic32
	.arch .avx10.2/256
	.text
_start:
	.irp u, "", u
	vcvtbf162i\u\()bs	%xmm5, %xmm6
	vcvtbf162i\u\()bs	%ymm5, %ymm6
	vcvtbf162i\u\()bs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvtbf162i\u\()bs	(%ecx){1to8}, %xmm6
	vcvtbf162i\u\()bs	2032(%ecx), %xmm6
	vcvtbf162i\u\()bs	-256(%edx){1to8}, %xmm6{%k7}{z}
	vcvtbf162i\u\()bs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvtbf162i\u\()bs	(%ecx){1to16}, %ymm6
	vcvtbf162i\u\()bs	4064(%ecx), %ymm6
	vcvtbf162i\u\()bs	-256(%edx){1to16}, %ymm6{%k7}{z}

	vcvtph2i\u\()bs	%xmm5, %xmm6
	vcvtph2i\u\()bs	%ymm5, %ymm6
	vcvtph2i\u\()bs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvtph2i\u\()bs	(%ecx){1to8}, %xmm6
	vcvtph2i\u\()bs	2032(%ecx), %xmm6
	vcvtph2i\u\()bs	-256(%edx){1to8}, %xmm6{%k7}{z}
	vcvtph2i\u\()bs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvtph2i\u\()bs	(%ecx){1to16}, %ymm6
	vcvtph2i\u\()bs	4064(%ecx), %ymm6
	vcvtph2i\u\()bs	-256(%edx){1to16}, %ymm6{%k7}{z}

	vcvtps2i\u\()bs	%xmm5, %xmm6
	vcvtps2i\u\()bs	%ymm5, %ymm6
	vcvtps2i\u\()bs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvtps2i\u\()bs	(%ecx){1to4}, %xmm6
	vcvtps2i\u\()bs	2032(%ecx), %xmm6
	vcvtps2i\u\()bs	-512(%edx){1to4}, %xmm6{%k7}{z}
	vcvtps2i\u\()bs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvtps2i\u\()bs	(%ecx){1to8}, %ymm6
	vcvtps2i\u\()bs	4064(%ecx), %ymm6
	vcvtps2i\u\()bs	-512(%edx){1to8}, %ymm6{%k7}{z}

	vcvttbf162i\u\()bs	%xmm5, %xmm6
	vcvttbf162i\u\()bs	%ymm5, %ymm6
	vcvttbf162i\u\()bs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvttbf162i\u\()bs	(%ecx){1to8}, %xmm6
	vcvttbf162i\u\()bs	2032(%ecx), %xmm6
	vcvttbf162i\u\()bs	-256(%edx){1to8}, %xmm6{%k7}{z}
	vcvttbf162i\u\()bs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvttbf162i\u\()bs	(%ecx){1to16}, %ymm6
	vcvttbf162i\u\()bs	4064(%ecx), %ymm6
	vcvttbf162i\u\()bs	-256(%edx){1to16}, %ymm6{%k7}{z}

	vcvttph2i\u\()bs	%xmm5, %xmm6
	vcvttph2i\u\()bs	%ymm5, %ymm6
	vcvttph2i\u\()bs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvttph2i\u\()bs	(%ecx){1to8}, %xmm6
	vcvttph2i\u\()bs	2032(%ecx), %xmm6
	vcvttph2i\u\()bs	-256(%edx){1to8}, %xmm6{%k7}{z}
	vcvttph2i\u\()bs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvttph2i\u\()bs	(%ecx){1to16}, %ymm6
	vcvttph2i\u\()bs	4064(%ecx), %ymm6
	vcvttph2i\u\()bs	-256(%edx){1to16}, %ymm6{%k7}{z}

	vcvttps2i\u\()bs	%xmm5, %xmm6
	vcvttps2i\u\()bs	%ymm5, %ymm6
	vcvttps2i\u\()bs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvttps2i\u\()bs	(%ecx){1to4}, %xmm6
	vcvttps2i\u\()bs	2032(%ecx), %xmm6
	vcvttps2i\u\()bs	-512(%edx){1to4}, %xmm6{%k7}{z}
	vcvttps2i\u\()bs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvttps2i\u\()bs	(%ecx){1to8}, %ymm6
	vcvttps2i\u\()bs	4064(%ecx), %ymm6
	vcvttps2i\u\()bs	-512(%edx){1to8}, %ymm6{%k7}{z}

	vcvttpd2\u\()dqs	%xmm5, %xmm6
	vcvttpd2\u\()dqs	%ymm5, %xmm6
	vcvttpd2\u\()dqsx	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvttpd2\u\()dqs	(%ecx){1to2}, %xmm6
	vcvttpd2\u\()dqsx	2032(%ecx), %xmm6
	vcvttpd2\u\()dqs	-1024(%edx){1to2}, %xmm6{%k7}{z}
	vcvttpd2\u\()dqs	(%ecx){1to4}, %xmm6
	vcvttpd2\u\()dqsy	4064(%ecx), %xmm6
	vcvttpd2\u\()dqs	-1024(%edx){1to4}, %xmm6{%k7}{z}

	vcvttpd2\u\()qqs	%xmm5, %xmm6
	vcvttpd2\u\()qqs	%ymm5, %ymm6
	vcvttpd2\u\()qqs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvttpd2\u\()qqs	(%ecx){1to2}, %xmm6
	vcvttpd2\u\()qqs	2032(%ecx), %xmm6
	vcvttpd2\u\()qqs	-1024(%edx){1to2}, %xmm6{%k7}{z}
	vcvttpd2\u\()qqs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvttpd2\u\()qqs	(%ecx){1to4}, %ymm6
	vcvttpd2\u\()qqs	4064(%ecx), %ymm6
	vcvttpd2\u\()qqs	-1024(%edx){1to4}, %ymm6{%k7}{z}

	vcvttps2\u\()dqs	%xmm5, %xmm6
	vcvttps2\u\()dqs	%ymm5, %ymm6
	vcvttps2\u\()dqs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvttps2\u\()dqs	(%ecx){1to4}, %xmm6
	vcvttps2\u\()dqs	2032(%ecx), %xmm6
	vcvttps2\u\()dqs	-512(%edx){1to4}, %xmm6{%k7}{z}
	vcvttps2\u\()dqs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvttps2\u\()dqs	(%ecx){1to8}, %ymm6
	vcvttps2\u\()dqs	4064(%ecx), %ymm6
	vcvttps2\u\()dqs	-512(%edx){1to8}, %ymm6{%k7}{z}

	vcvttps2\u\()qqs	%xmm5, %xmm6
	vcvttps2\u\()qqs	%xmm5, %ymm6
	vcvttps2\u\()qqs	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvttps2\u\()qqs	(%ecx){1to2}, %xmm6
	vcvttps2\u\()qqs	1016(%ecx), %xmm6
	vcvttps2\u\()qqs	-512(%edx){1to2}, %xmm6{%k7}{z}
	vcvttps2\u\()qqs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvttps2\u\()qqs	(%ecx){1to4}, %ymm6
	vcvttps2\u\()qqs	2032(%ecx), %ymm6
	vcvttps2\u\()qqs	-512(%edx){1to4}, %ymm6{%k7}{z}

	vcvttsd2\u\()sis	%xmm6, %edx
	vcvttsd2\u\()sis	{sae}, %xmm6, %edx
	vcvttsd2\u\()sis	0x10000000(%esp, %esi, 8), %edx
	vcvttsd2\u\()sis	(%ecx), %edx
	vcvttsd2\u\()sis	1016(%ecx), %edx
	vcvttsd2\u\()sis	-1024(%edx), %edx

	vcvttss2\u\()sis	%xmm6, %edx
	vcvttss2\u\()sis	{sae}, %xmm6, %edx
	vcvttss2\u\()sis	0x10000000(%esp, %esi, 8), %edx
	vcvttss2\u\()sis	(%ecx), %edx
	vcvttss2\u\()sis	508(%ecx), %edx
	vcvttss2\u\()sis	-512(%edx), %edx
	.endr

_intel:
	.intel_syntax noprefix
	.irp u, "", u
	vcvtbf162i\u\()bs	xmm6, xmm5
	vcvtbf162i\u\()bs	ymm6, ymm5
	vcvtbf162i\u\()bs	xmm6{k7}, [esp+esi*8+0x10000000]
	vcvtbf162i\u\()bs	xmm6, [ecx]{1to8}
	vcvtbf162i\u\()bs	xmm6, XMMWORD PTR [ecx+2032]
	vcvtbf162i\u\()bs	xmm6{k7}{z}, WORD PTR [edx-256]{1to8}
	vcvtbf162i\u\()bs	ymm6{k7}, [esp+esi*8+0x10000000]
	vcvtbf162i\u\()bs	ymm6, [ecx]{1to16}
	vcvtbf162i\u\()bs	ymm6, YMMWORD PTR [ecx+4064]
	vcvtbf162i\u\()bs	ymm6{k7}{z}, WORD PTR [edx-256]{1to16}

	vcvtph2i\u\()bs	xmm6, xmm5
	vcvtph2i\u\()bs	ymm6, ymm5
	vcvtph2i\u\()bs	xmm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvtph2i\u\()bs	xmm6, WORD PTR [ecx]{1to8}
	vcvtph2i\u\()bs	xmm6, [ecx+2032]
	vcvtph2i\u\()bs	xmm6{k7}{z}, [edx-256]{1to8}
	vcvtph2i\u\()bs	ymm6{k7}, YMMWORD PTR [esp+esi*8+0x10000000]
	vcvtph2i\u\()bs	ymm6, WORD PTR [ecx]{1to16}
	vcvtph2i\u\()bs	ymm6, [ecx+4064]
	vcvtph2i\u\()bs	ymm6{k7}{z}, [edx-256]{1to16}

	vcvtps2i\u\()bs	xmm6, xmm5
	vcvtps2i\u\()bs	ymm6, ymm5
	vcvtps2i\u\()bs	xmm6{k7}, [esp+esi*8+0x10000000]
	vcvtps2i\u\()bs	xmm6, [ecx]{1to4}
	vcvtps2i\u\()bs	xmm6, XMMWORD PTR [ecx+2032]
	vcvtps2i\u\()bs	xmm6{k7}{z}, DWORD PTR [edx-512]{1to4}
	vcvtps2i\u\()bs	ymm6{k7}, YMMWORD PTR [esp+esi*8+0x10000000]
	vcvtps2i\u\()bs	ymm6, DWORD PTR [ecx]{1to8}
	vcvtps2i\u\()bs	ymm6, [ecx+4064]
	vcvtps2i\u\()bs	ymm6{k7}{z}, [edx-512]{1to8}

	vcvttbf162i\u\()bs	xmm6, xmm5
	vcvttbf162i\u\()bs	ymm6, ymm5
	vcvttbf162i\u\()bs	xmm6{k7}, [esp+esi*8+0x10000000]
	vcvttbf162i\u\()bs	xmm6, [ecx]{1to8}
	vcvttbf162i\u\()bs	xmm6, XMMWORD PTR [ecx+2032]
	vcvttbf162i\u\()bs	xmm6{k7}{z}, WORD PTR [edx-256]{1to8}
	vcvttbf162i\u\()bs	ymm6{k7}, [esp+esi*8+0x10000000]
	vcvttbf162i\u\()bs	ymm6, [ecx]{1to16}
	vcvttbf162i\u\()bs	ymm6, YMMWORD PTR [ecx+4064]
	vcvttbf162i\u\()bs	ymm6{k7}{z}, WORD PTR [edx-256]{1to16}

	vcvttph2i\u\()bs	xmm6, xmm5
	vcvttph2i\u\()bs	ymm6, ymm5
	vcvttph2i\u\()bs	xmm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvttph2i\u\()bs	xmm6, WORD PTR [ecx]{1to8}
	vcvttph2i\u\()bs	xmm6, [ecx+2032]
	vcvttph2i\u\()bs	xmm6{k7}{z}, [edx-256]{1to8}
	vcvttph2i\u\()bs	ymm6{k7}, [esp+esi*8+0x10000000]
	vcvttph2i\u\()bs	ymm6, [ecx]{1to16}
	vcvttph2i\u\()bs	ymm6, YMMWORD PTR [ecx+4064]
	vcvttph2i\u\()bs	ymm6{k7}{z}, WORD PTR [edx-256]{1to16}

	vcvttps2i\u\()bs	xmm6, xmm5
	vcvttps2i\u\()bs	ymm6, ymm5
	vcvttps2i\u\()bs	xmm6{k7}, [esp+esi*8+0x10000000]
	vcvttps2i\u\()bs	xmm6, [ecx]{1to4}
	vcvttps2i\u\()bs	xmm6, XMMWORD PTR [ecx+2032]
	vcvttps2i\u\()bs	xmm6{k7}{z}, DWORD PTR [edx-512]{1to4}
	vcvttps2i\u\()bs	ymm6{k7}, [esp+esi*8+0x10000000]
	vcvttps2i\u\()bs	ymm6, [ecx]{1to8}
	vcvttps2i\u\()bs	ymm6, YMMWORD PTR [ecx+4064]
	vcvttps2i\u\()bs	ymm6{k7}{z}, DWORD PTR [edx-512]{1to8}

	vcvttpd2\u\()dqs	xmm6, xmm5
	vcvttpd2\u\()dqs	xmm6, ymm5
	vcvttpd2\u\()dqs	xmm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvttpd2\u\()dqs	xmm6, QWORD PTR [ecx]{1to2}
	vcvttpd2\u\()dqs	xmm6, XMMWORD PTR [ecx+2032]
	vcvttpd2\u\()dqs	xmm6{k7}{z}, [edx-1024]{1to2}
	vcvttpd2\u\()dqs	xmm6, QWORD PTR [ecx]{1to4}
	vcvttpd2\u\()dqs	xmm6, YMMWORD PTR [ecx+4064]
	vcvttpd2\u\()dqs	xmm6{k7}{z}, [edx-1024]{1to4}

	vcvttpd2\u\()qqs	xmm6, xmm5
	vcvttpd2\u\()qqs	ymm6, ymm5
	vcvttpd2\u\()qqs	xmm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvttpd2\u\()qqs	xmm6, [ecx]{1to2}
	vcvttpd2\u\()qqs	xmm6, [ecx+2032]
	vcvttpd2\u\()qqs	xmm6{k7}{z}, QWORD PTR [edx-1024]{1to2}
	vcvttpd2\u\()qqs	ymm6{k7}, YMMWORD PTR [esp+esi*8+0x10000000]
	vcvttpd2\u\()qqs	ymm6, QWORD PTR [ecx]{1to4}
	vcvttpd2\u\()qqs	ymm6, [ecx+4064]
	vcvttpd2\u\()qqs	ymm6{k7}{z}, [edx-1024]{1to4}

	vcvttps2\u\()dqs	xmm6, xmm5
	vcvttps2\u\()dqs	ymm6, ymm5
	vcvttps2\u\()dqs	xmm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvttps2\u\()dqs	xmm6, DWORD PTR [ecx]{1to4}
	vcvttps2\u\()dqs	xmm6, [ecx+2032]
	vcvttps2\u\()dqs	xmm6{k7}{z}, [edx-512]{1to4}
	vcvttps2\u\()dqs	ymm6{k7}, [esp+esi*8+0x10000000]
	vcvttps2\u\()dqs	ymm6, [ecx]{1to8}
	vcvttps2\u\()dqs	ymm6, YMMWORD PTR [ecx+4064]
	vcvttps2\u\()dqs	ymm6{k7}{z}, DWORD PTR [edx-512]{1to8}

	vcvttps2\u\()qqs	xmm6, xmm5
	vcvttps2\u\()qqs	ymm6, xmm5
	vcvttps2\u\()qqs	xmm6{k7}, [esp+esi*8+0x10000000]
	vcvttps2\u\()qqs	xmm6, [ecx]{1to2}
	vcvttps2\u\()qqs	xmm6, QWORD PTR [ecx+1016]
	vcvttps2\u\()qqs	xmm6{k7}{z}, DWORD PTR [edx-512]{1to2}
	vcvttps2\u\()qqs	ymm6{k7}, [esp+esi*8+0x10000000]
	vcvttps2\u\()qqs	ymm6, [ecx]{1to4}
	vcvttps2\u\()qqs	ymm6, XMMWORD PTR [ecx+2032]
	vcvttps2\u\()qqs	ymm6{k7}{z}, DWORD PTR [edx-512]{1to4}

	vcvttsd2\u\()sis	edx, xmm6
	vcvttsd2\u\()sis	edx, xmm6, {sae}
	vcvttsd2\u\()sis	edx, [esp+esi*8+0x10000000]
	vcvttsd2\u\()sis	edx, QWORD PTR [ecx]
	vcvttsd2\u\()sis	edx, [ecx+1016]
	vcvttsd2\u\()sis	edx, QWORD PTR [edx-1024]

	vcvttss2\u\()sis	edx, xmm6
	vcvttss2\u\()sis	edx, xmm6, {sae}
	vcvttss2\u\()sis	edx, DWORD PTR [esp+esi*8+0x10000000]
	vcvttss2\u\()sis	edx, [ecx]
	vcvttss2\u\()sis	edx, DWORD PTR [ecx+508]
	vcvttss2\u\()sis	edx, [edx-512]
	.endr
