# Check 32bit AVX10.2/256 instructions

	.arch generic32
	.arch .avx10.2/256
	.text
_start:
	.irp m, bf16, pd, ph, ps
	vminmax\m	$123, %xmm4, %xmm5, %xmm6
	vminmax\m	$123, %ymm4, %ymm5, %ymm6
	vminmax\m	$123, 0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vminmax\m	$123, 4064(%ecx), %ymm5, %ymm6
	vminmax\m	$123, 0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vminmax\m	$123, 2032(%ecx), %xmm5, %xmm6
	.endr

	vminmaxbf16	$123, (%ecx){1to16}, %ymm5, %ymm6
	vminmaxbf16	$123, -256(%edx){1to16}, %ymm5, %ymm6{%k7}{z}
	vminmaxbf16	$123, (%ecx){1to8}, %xmm5, %xmm6
	vminmaxbf16	$123, -256(%edx){1to8}, %xmm5, %xmm6{%k7}{z}
	vminmaxpd	$123, (%ecx){1to4}, %ymm5, %ymm6
	vminmaxpd	$123, -1024(%edx){1to4}, %ymm5, %ymm6{%k7}{z}
	vminmaxpd	$123, (%ecx){1to2}, %xmm5, %xmm6
	vminmaxpd	$123, -1024(%edx){1to2}, %xmm5, %xmm6{%k7}{z}
	vminmaxph	$123, (%ecx){1to16}, %ymm5, %ymm6
	vminmaxph	$123, -256(%edx){1to16}, %ymm5, %ymm6{%k7}{z}
	vminmaxph	$123, (%ecx){1to8}, %xmm5, %xmm6
	vminmaxph	$123, -256(%edx){1to8}, %xmm5, %xmm6{%k7}{z}
	vminmaxps	$123, (%ecx){1to8}, %ymm5, %ymm6
	vminmaxps	$123, -512(%edx){1to8}, %ymm5, %ymm6{%k7}{z}
	vminmaxps	$123, (%ecx){1to4}, %xmm5, %xmm6
	vminmaxps	$123, -512(%edx){1to4}, %xmm5, %xmm6{%k7}{z}

	.irp m, d, h, s
	vminmaxs\m	$123, %xmm4, %xmm5, %xmm6
	vminmaxs\m	$123, {sae}, %xmm4, %xmm5, %xmm6
	vminmaxs\m	$123, 0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vminmaxs\m	$123, (%ecx), %xmm5, %xmm6
	.endr

	vminmaxsd	$123, 1016(%ecx), %xmm5, %xmm6
	vminmaxsd	$123, -1024(%edx), %xmm5, %xmm6{%k7}{z}
	vminmaxsh	$123, 254(%ecx), %xmm5, %xmm6
	vminmaxsh	$123, -256(%edx), %xmm5, %xmm6{%k7}{z}
	vminmaxss	$123, 508(%ecx), %xmm5, %xmm6
	vminmaxss	$123, -512(%edx), %xmm5, %xmm6{%k7}{z}

	vmovd	%xmm5, %xmm6
	vmovd.s	%xmm5, %xmm6
	vmovw	%xmm5, %xmm6
	vmovw.s	%xmm5, %xmm6

	.irp u, "", u
	.irp m, d, h, s
	v\u\()comxs\m	%xmm5, %xmm6
	v\u\()comxs\m	{sae}, %xmm5, %xmm6
	v\u\()comxs\m	0x10000000(%esp, %esi, 8), %xmm6
	v\u\()comxs\m	(%ecx), %xmm6
	.endr

	v\u\()comxsd	1016(%ecx), %xmm6
	v\u\()comxsd	-1024(%edx), %xmm6
	v\u\()comxsh	254(%ecx), %xmm6
	v\u\()comxsh	-256(%edx), %xmm6
	v\u\()comxss	508(%ecx), %xmm6
	v\u\()comxss	-512(%edx), %xmm6
	.endr

_intel:
	.intel_syntax noprefix
	.irp m, bf16, pd, ph, ps
	vminmax\m	xmm6, xmm5, xmm4, 123
	vminmax\m	ymm6, ymm5, ymm4, 123
	vminmax\m	ymm6{k7}, ymm5, [esp+esi*8+0x10000000], 123
	vminmax\m	ymm6, ymm5, YMMWORD PTR [ecx+4064], 123
	vminmax\m	xmm6{k7}, xmm5, [esp+esi*8+0x10000000], 123
	vminmax\m	xmm6, xmm5, XMMWORD PTR [ecx+2032], 123
	.endr

	vminmaxbf16	ymm6, ymm5, [ecx]{1to16}, 123
	vminmaxbf16	ymm6{k7}{z}, ymm5, WORD PTR [edx-256]{1to16}, 123
	vminmaxbf16	xmm6, xmm5, [ecx]{1to8}, 123
	vminmaxbf16	xmm6{k7}{z}, xmm5, WORD PTR [edx-256]{1to8}, 123
	vminmaxpd	ymm6, ymm5, QWORD PTR [ecx]{1to4}, 123
	vminmaxpd	ymm6{k7}{z}, ymm5, [edx-1024]{1to4}, 123
	vminmaxpd	xmm6, xmm5, QWORD PTR [ecx]{1to2}, 123
	vminmaxpd	xmm6{k7}{z}, xmm5, [edx-1024]{1to2}, 123
	vminmaxph	ymm6, ymm5, [ecx]{1to16}, 123
	vminmaxph	ymm6{k7}{z}, ymm5, WORD PTR [edx-256]{1to16}, 123
	vminmaxph	xmm6, xmm5, WORD PTR [ecx]{1to8}, 123
	vminmaxph	xmm6{k7}{z}, xmm5, [edx-256]{1to8}, 123
	vminmaxps	ymm6, ymm5, DWORD PTR [ecx]{1to8}, 123
	vminmaxps	ymm6{k7}{z}, ymm5, [edx-512]{1to8}, 123
	vminmaxps	xmm6, xmm5, [ecx]{1to4}, 123
	vminmaxps	xmm6{k7}{z}, xmm5, DWORD PTR [edx-512]{1to4}, 123

	.irp m, d, h, s
	vminmaxs\m	xmm6, xmm5, xmm4, 123
	vminmaxs\m	xmm6, xmm5, xmm4, {sae}, 123
	vminmaxs\m	xmm6{k7}, xmm5, [esp+esi*8+0x10000000], 123
	vminmaxs\m	xmm6, xmm5, [ecx], 123
	.endr

	vminmaxsd	xmm6, xmm5, [ecx+1016], 123
	vminmaxsd	xmm6{k7}{z}, xmm5, QWORD PTR [edx-1024], 123
	vminmaxsh	xmm6, xmm5, [ecx+254], 123
	vminmaxsh	xmm6{k7}{z}, xmm5, WORD PTR [edx-256], 123
	vminmaxss	xmm6, xmm5, DWORD PTR [ecx+508], 123
	vminmaxss	xmm6{k7}{z}, xmm5, [edx-512], 123

	vmovd	xmm6, xmm5
	vmovd.s	xmm6, xmm5
	vmovw	xmm6, xmm5
	vmovw.s	xmm6, xmm5

	.irp u, "", u
	.irp m, d, h, s
	v\u\()comxs\m	xmm6, xmm5
	v\u\()comxs\m	xmm6, xmm5, {sae}
	v\u\()comxs\m	xmm6, [esp+esi*8+0x10000000]
	v\u\()comxs\m	xmm6, [ecx]
	.endr

	v\u\()comxsd	xmm6, [ecx+1016]
	v\u\()comxsd	xmm6, QWORD PTR [edx-1024]
	v\u\()comxsh	xmm6, [ecx+254]
	v\u\()comxsh	xmm6, WORD PTR [edx-256]
	v\u\()comxss	xmm6, DWORD PTR [ecx+508]
	v\u\()comxss	xmm6, [edx-512]
	.endr
