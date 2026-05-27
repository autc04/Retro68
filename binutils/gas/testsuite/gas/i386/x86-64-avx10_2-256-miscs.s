# Check 64bit AVX10.2/256 instructions

	.arch generic64
	.arch .avx10.2/256
	.text
_start:
	.irp m, bf16, pd, ph, ps
	vminmax\m	$123, %xmm28, %xmm29, %xmm30
	vminmax\m	$123, %ymm28, %ymm29, %ymm30
	vminmax\m	$123, 0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vminmax\m	$123, 4064(%rcx), %ymm29, %ymm30
	vminmax\m	$123, 0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vminmax\m	$123, 2032(%rcx), %xmm29, %xmm30
	.endr

	vminmaxbf16	$123, (%r9){1to16}, %ymm29, %ymm30
	vminmaxbf16	$123, -256(%rdx){1to16}, %ymm29, %ymm30{%k7}{z}
	vminmaxbf16	$123, (%r9){1to8}, %xmm29, %xmm30
	vminmaxbf16	$123, -256(%rdx){1to8}, %xmm29, %xmm30{%k7}{z}
	vminmaxpd	$123, (%r9){1to4}, %ymm29, %ymm30
	vminmaxpd	$123, -1024(%rdx){1to4}, %ymm29, %ymm30{%k7}{z}
	vminmaxpd	$123, (%r9){1to2}, %xmm29, %xmm30
	vminmaxpd	$123, -1024(%rdx){1to2}, %xmm29, %xmm30{%k7}{z}
	vminmaxph	$123, (%r9){1to16}, %ymm29, %ymm30
	vminmaxph	$123, -256(%rdx){1to16}, %ymm29, %ymm30{%k7}{z}
	vminmaxph	$123, (%r9){1to8}, %xmm29, %xmm30
	vminmaxph	$123, -256(%rdx){1to8}, %xmm29, %xmm30{%k7}{z}
	vminmaxps	$123, (%r9){1to8}, %ymm29, %ymm30
	vminmaxps	$123, -512(%rdx){1to8}, %ymm29, %ymm30{%k7}{z}
	vminmaxps	$123, (%r9){1to4}, %xmm29, %xmm30
	vminmaxps	$123, -512(%rdx){1to4}, %xmm29, %xmm30{%k7}{z}

	.irp m, d, h, s
	vminmaxs\m	$123, %xmm28, %xmm29, %xmm30
	vminmaxs\m	$123, {sae}, %xmm28, %xmm29, %xmm30
	vminmaxs\m	$123, 0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vminmaxs\m	$123, (%r9), %xmm29, %xmm30
	.endr

	vminmaxsd	$123, 1016(%rcx), %xmm29, %xmm30
	vminmaxsd	$123, -1024(%rdx), %xmm29, %xmm30{%k7}{z}
	vminmaxsh	$123, 254(%rcx), %xmm29, %xmm30
	vminmaxsh	$123, -256(%rdx), %xmm29, %xmm30{%k7}{z}
	vminmaxss	$123, 508(%rcx), %xmm29, %xmm30
	vminmaxss	$123, -512(%rdx), %xmm29, %xmm30{%k7}{z}

	vmovd	%xmm29, %xmm30
	vmovd.s	%xmm29, %xmm30
	vmovw	%xmm29, %xmm30
	vmovw.s	%xmm29, %xmm30

	.irp u, "", u
	.irp m, d, h, s
	v\u\()comxs\m	%xmm29, %xmm30
	v\u\()comxs\m	{sae}, %xmm29, %xmm30
	v\u\()comxs\m	0x10000000(%rbp, %r14, 8), %xmm30
	v\u\()comxs\m	(%r9), %xmm30
	.endr

	v\u\()comxsd	1016(%rcx), %xmm30
	v\u\()comxsd	-1024(%rdx), %xmm30
	v\u\()comxsh	254(%rcx), %xmm30
	v\u\()comxsh	-256(%rdx), %xmm30
	v\u\()comxss	508(%rcx), %xmm30
	v\u\()comxss	-512(%rdx), %xmm30
	.endr

_intel:
	.intel_syntax noprefix
	.irp m, bf16, pd, ph, ps
	vminmax\m	xmm30, xmm29, xmm28, 123
	vminmax\m	ymm30, ymm29, ymm28, 123
	vminmax\m	ymm30{k7}, ymm29, [rbp+r14*8+0x10000000], 123
	vminmax\m	ymm30, ymm29, YMMWORD PTR [rcx+4064], 123
	vminmax\m	xmm30{k7}, xmm29, [rbp+r14*8+0x10000000], 123
	vminmax\m	xmm30, xmm29, XMMWORD PTR [rcx+2032], 123
	.endr

	vminmaxbf16	ymm30, ymm29, [r9]{1to16}, 123
	vminmaxbf16	ymm30{k7}{z}, ymm29, WORD PTR [rdx-256]{1to16}, 123
	vminmaxbf16	xmm30, xmm29, [r9]{1to8}, 123
	vminmaxbf16	xmm30{k7}{z}, xmm29, WORD PTR [rdx-256]{1to8}, 123
	vminmaxpd	ymm30, ymm29, QWORD PTR [r9]{1to4}, 123
	vminmaxpd	ymm30{k7}{z}, ymm29, [rdx-1024]{1to4}, 123
	vminmaxpd	xmm30, xmm29, QWORD PTR [r9]{1to2}, 123
	vminmaxpd	xmm30{k7}{z}, xmm29, [rdx-1024]{1to2}, 123
	vminmaxph	ymm30, ymm29, [r9]{1to16}, 123
	vminmaxph	ymm30{k7}{z}, ymm29, WORD PTR [rdx-256]{1to16}, 123
	vminmaxph	xmm30, xmm29, WORD PTR [r9]{1to8}, 123
	vminmaxph	xmm30{k7}{z}, xmm29, [rdx-256]{1to8}, 123
	vminmaxps	ymm30, ymm29, DWORD PTR [r9]{1to8}, 123
	vminmaxps	ymm30{k7}{z}, ymm29, [rdx-512]{1to8}, 123
	vminmaxps	xmm30, xmm29, [r9]{1to4}, 123
	vminmaxps	xmm30{k7}{z}, xmm29, DWORD PTR [rdx-512]{1to4}, 123

	.irp m, d, h, s
	vminmaxs\m	xmm30, xmm29, xmm28, 123
	vminmaxs\m	xmm30, xmm29, xmm28, {sae}, 123
	vminmaxs\m	xmm30{k7}, xmm29, [rbp+r14*8+0x10000000], 123
	vminmaxs\m	xmm30, xmm29, [r9], 123
	.endr

	vminmaxsd	xmm30, xmm29, QWORD PTR [rcx+1016], 123
	vminmaxsd	xmm30{k7}{z}, xmm29, QWORD PTR [rdx-1024], 123
	vminmaxsh	xmm30, xmm29, [rcx+254], 123
	vminmaxsh	xmm30{k7}{z}, xmm29, [rdx-256], 123
	vminmaxss	xmm30, xmm29, DWORD PTR [rcx+508], 123
	vminmaxss	xmm30{k7}{z}, xmm29, [rdx-512], 123

	vmovd	xmm30, xmm29
	vmovd.s	xmm30, xmm29
	vmovw	xmm30, xmm29
	vmovw.s	xmm30, xmm29

	.irp u, "", u
	.irp m, d, h, s
	v\u\()comxs\m	xmm30, xmm29
	v\u\()comxs\m	xmm30, xmm29, {sae}
	v\u\()comxs\m	xmm30, [rbp+r14*8+0x10000000]
	v\u\()comxs\m	xmm30, [r9]
	.endr

	v\u\()comxsd	xmm30, QWORD PTR [rcx+1016]
	v\u\()comxsd	xmm30, [rdx-1024]
	v\u\()comxsh	xmm30, [rcx+254]
	v\u\()comxsh	xmm30, WORD PTR [rdx-256]
	v\u\()comxss	xmm30, [rcx+508]
	v\u\()comxss	xmm30, DWORD PTR [rdx-512]
	.endr
