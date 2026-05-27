# Check 32bit AVX10.2/512 instructions

	.arch generic32
	.arch .avx10.2/512
	.text
_start:
	.irp u, "", u
	vcvtbf162i\u\()bs	%zmm5, %zmm6
	vcvtbf162i\u\()bs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvtbf162i\u\()bs	(%ecx){1to32}, %zmm6
	vcvtbf162i\u\()bs	8128(%ecx), %zmm6
	vcvtbf162i\u\()bs	-256(%edx){1to32}, %zmm6{%k7}{z}

	vcvtph2i\u\()bs	%zmm5, %zmm6
	vcvtph2i\u\()bs	{rn-sae}, %zmm5, %zmm6
	vcvtph2i\u\()bs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvtph2i\u\()bs	(%ecx){1to32}, %zmm6
	vcvtph2i\u\()bs	8128(%ecx), %zmm6
	vcvtph2i\u\()bs	-256(%edx){1to32}, %zmm6{%k7}{z}

	vcvtps2i\u\()bs	%zmm5, %zmm6
	vcvtps2i\u\()bs	{rn-sae}, %zmm5, %zmm6
	vcvtps2i\u\()bs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvtps2i\u\()bs	(%ecx){1to16}, %zmm6
	vcvtps2i\u\()bs	8128(%ecx), %zmm6
	vcvtps2i\u\()bs	-512(%edx){1to16}, %zmm6{%k7}{z}

	vcvttbf162i\u\()bs	%zmm5, %zmm6
	vcvttbf162i\u\()bs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvttbf162i\u\()bs	(%ecx){1to32}, %zmm6
	vcvttbf162i\u\()bs	8128(%ecx), %zmm6
	vcvttbf162i\u\()bs	-256(%edx){1to32}, %zmm6{%k7}{z}

	vcvttph2i\u\()bs	%zmm5, %zmm6
	vcvttph2i\u\()bs	{sae}, %zmm5, %zmm6
	vcvttph2i\u\()bs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvttph2i\u\()bs	(%ecx){1to32}, %zmm6
	vcvttph2i\u\()bs	8128(%ecx), %zmm6
	vcvttph2i\u\()bs	-256(%edx){1to32}, %zmm6{%k7}{z}

	vcvttps2i\u\()bs	%zmm5, %zmm6
	vcvttps2i\u\()bs	{sae}, %zmm5, %zmm6
	vcvttps2i\u\()bs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvttps2i\u\()bs	(%ecx){1to16}, %zmm6
	vcvttps2i\u\()bs	8128(%ecx), %zmm6
	vcvttps2i\u\()bs	-512(%edx){1to16}, %zmm6{%k7}{z}

	vcvttpd2\u\()dqs	%zmm5, %ymm6
	vcvttpd2\u\()dqs	{sae}, %zmm5, %ymm6
	vcvttpd2\u\()dqs	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvttpd2\u\()dqs	(%ecx){1to8}, %ymm6
	vcvttpd2\u\()dqs	8128(%ecx), %ymm6
	vcvttpd2\u\()dqs	-1024(%edx){1to8}, %ymm6{%k7}{z}

	vcvttpd2\u\()qqs	%zmm5, %zmm6
	vcvttpd2\u\()qqs	{sae}, %zmm5, %zmm6
	vcvttpd2\u\()qqs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvttpd2\u\()qqs	(%ecx){1to8}, %zmm6
	vcvttpd2\u\()qqs	8128(%ecx), %zmm6
	vcvttpd2\u\()qqs	-1024(%edx){1to8}, %zmm6{%k7}{z}

	vcvttps2\u\()dqs	%zmm5, %zmm6
	vcvttps2\u\()dqs	{sae}, %zmm5, %zmm6
	vcvttps2\u\()dqs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvttps2\u\()dqs	(%ecx){1to16}, %zmm6
	vcvttps2\u\()dqs	8128(%ecx), %zmm6
	vcvttps2\u\()dqs	-512(%edx){1to16}, %zmm6{%k7}{z}

	vcvttps2\u\()qqs	%ymm5, %zmm6
	vcvttps2\u\()qqs	{sae}, %ymm5, %zmm6
	vcvttps2\u\()qqs	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvttps2\u\()qqs	(%ecx){1to8}, %zmm6
	vcvttps2\u\()qqs	4064(%ecx), %zmm6
	vcvttps2\u\()qqs	-512(%edx){1to8}, %zmm6{%k7}{z}
	.endr

_intel:
	.intel_syntax noprefix
	.irp u, "", u
	vcvtbf162i\u\()bs	zmm6, zmm5
	vcvtbf162i\u\()bs	zmm6{k7}, [esp+esi*8+0x10000000]
	vcvtbf162i\u\()bs	zmm6, [ecx]{1to32}
	vcvtbf162i\u\()bs	zmm6, ZMMWORD PTR [ecx+8128]
	vcvtbf162i\u\()bs	zmm6{k7}{z}, WORD PTR [edx-256]{1to32}

	vcvtph2i\u\()bs	zmm6, zmm5
	vcvtph2i\u\()bs	zmm6, zmm5, {rn-sae}
	vcvtph2i\u\()bs	zmm6{k7}, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvtph2i\u\()bs	zmm6, WORD PTR [ecx]{1to32}
	vcvtph2i\u\()bs	zmm6, [ecx+8128]
	vcvtph2i\u\()bs	zmm6{k7}{z}, [edx-256]{1to32}

	vcvtps2i\u\()bs	zmm6, zmm5
	vcvtps2i\u\()bs	zmm6, zmm5, {rn-sae}
	vcvtps2i\u\()bs	zmm6{k7}, [esp+esi*8+0x10000000]
	vcvtps2i\u\()bs	zmm6, [ecx]{1to16}
	vcvtps2i\u\()bs	zmm6, ZMMWORD PTR [ecx+8128]
	vcvtps2i\u\()bs	zmm6{k7}{z}, DWORD PTR [edx-512]{1to16}

	vcvttbf162i\u\()bs	zmm6, zmm5
	vcvttbf162i\u\()bs	zmm6{k7}, [esp+esi*8+0x10000000]
	vcvttbf162i\u\()bs	zmm6, [ecx]{1to32}
	vcvttbf162i\u\()bs	zmm6, ZMMWORD PTR [ecx+8128]
	vcvttbf162i\u\()bs	zmm6{k7}{z}, WORD PTR [edx-256]{1to32}

	vcvttph2i\u\()bs	zmm6, zmm5
	vcvttph2i\u\()bs	zmm6, zmm5, {sae}
	vcvttph2i\u\()bs	zmm6{k7}, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvttph2i\u\()bs	zmm6, WORD PTR [ecx]{1to32}
	vcvttph2i\u\()bs	zmm6, [ecx+8128]
	vcvttph2i\u\()bs	zmm6{k7}{z}, [edx-256]{1to32}

	vcvttps2i\u\()bs	zmm6, zmm5
	vcvttps2i\u\()bs	zmm6, zmm5, {sae}
	vcvttps2i\u\()bs	zmm6{k7}, [esp+esi*8+0x10000000]
	vcvttps2i\u\()bs	zmm6, [ecx]{1to16}
	vcvttps2i\u\()bs	zmm6, ZMMWORD PTR [ecx+8128]
	vcvttps2i\u\()bs	zmm6{k7}{z}, DWORD PTR [edx-512]{1to16}

	vcvttpd2\u\()dqs	ymm6, zmm5
	vcvttpd2\u\()dqs	ymm6, zmm5, {sae}
	vcvttpd2\u\()dqs	ymm6{k7}, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvttpd2\u\()dqs	ymm6, QWORD PTR [ecx]{1to8}
	vcvttpd2\u\()dqs	ymm6, [ecx+8128]
	vcvttpd2\u\()dqs	ymm6{k7}{z}, [edx-1024]{1to8}

	vcvttpd2\u\()qqs	zmm6, zmm5
	vcvttpd2\u\()qqs	zmm6, zmm5, {sae}
	vcvttpd2\u\()qqs	zmm6{k7}, [esp+esi*8+0x10000000]
	vcvttpd2\u\()qqs	zmm6, [ecx]{1to8}
	vcvttpd2\u\()qqs	zmm6, ZMMWORD PTR [ecx+8128]
	vcvttpd2\u\()qqs	zmm6{k7}{z}, QWORD PTR [edx-1024]{1to8}

	vcvttps2\u\()dqs	zmm6, zmm5
	vcvttps2\u\()dqs	zmm6, zmm5, {sae}
	vcvttps2\u\()dqs	zmm6{k7}, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvttps2\u\()dqs	zmm6, [ecx]{1to16}
	vcvttps2\u\()dqs	zmm6, [ecx+8128]
	vcvttps2\u\()dqs	zmm6{k7}{z}, DWORD PTR [edx-512]{1to16}

	vcvttps2\u\()qqs	zmm6, ymm5
	vcvttps2\u\()qqs	zmm6, ymm5, {sae}
	vcvttps2\u\()qqs	zmm6{k7}, [esp+esi*8+0x10000000]
	vcvttps2\u\()qqs	zmm6, DWORD PTR [ecx]{1to8}
	vcvttps2\u\()qqs	zmm6, YMMWORD PTR [ecx+4064]
	vcvttps2\u\()qqs	zmm6{k7}{z}, [edx-512]{1to8}
	.endr
