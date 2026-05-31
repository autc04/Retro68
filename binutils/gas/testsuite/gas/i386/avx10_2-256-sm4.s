# Check 32bit SM4 instructions

	.text
_start:
	{evex} vsm4key4	%ymm4, %ymm5, %ymm6
	{evex} vsm4key4	%xmm4, %xmm5, %xmm6
	{evex} vsm4key4	0x10000000(%esp, %esi, 8), %ymm5, %ymm6
	{evex} vsm4key4	(%ecx), %ymm5, %ymm6
	{evex} vsm4key4	4064(%ecx), %ymm5, %ymm6
	{evex} vsm4key4	-4096(%edx), %ymm5, %ymm6
	{evex} vsm4key4	0x10000000(%esp, %esi, 8), %xmm5, %xmm6
	{evex} vsm4key4	(%ecx), %xmm5, %xmm6
	{evex} vsm4key4	2032(%ecx), %xmm5, %xmm6
	{evex} vsm4key4	-2048(%edx), %xmm5, %xmm6
	{evex} vsm4rnds4	%ymm4, %ymm5, %ymm6
	{evex} vsm4rnds4	%xmm4, %xmm5, %xmm6
	{evex} vsm4rnds4	0x10000000(%esp, %esi, 8), %ymm5, %ymm6
	{evex} vsm4rnds4	(%ecx), %ymm5, %ymm6
	{evex} vsm4rnds4	4064(%ecx), %ymm5, %ymm6
	{evex} vsm4rnds4	-4096(%edx), %ymm5, %ymm6
	{evex} vsm4rnds4	0x10000000(%esp, %esi, 8), %xmm5, %xmm6
	{evex} vsm4rnds4	(%ecx), %xmm5, %xmm6
	{evex} vsm4rnds4	2032(%ecx), %xmm5, %xmm6
	{evex} vsm4rnds4	-2048(%edx), %xmm5, %xmm6

_intel:
	.intel_syntax noprefix
	{evex} vsm4key4	ymm6, ymm5, ymm4
	{evex} vsm4key4	xmm6, xmm5, xmm4
	{evex} vsm4key4	ymm6, ymm5, [esp+esi*8+0x10000000]
	{evex} vsm4key4	ymm6, ymm5, YMMWORD PTR [ecx] 
	{evex} vsm4key4	ymm6, ymm5, [ecx+4064]
	{evex} vsm4key4	ymm6, ymm5, YMMWORD PTR [edx-4096]
	{evex} vsm4key4	xmm6, xmm5, XMMWORD PTR [esp+esi*8+0x10000000]
	{evex} vsm4key4	xmm6, xmm5, [ecx] 
	{evex} vsm4key4	xmm6, xmm5, [ecx+2032]
	{evex} vsm4key4	xmm6, xmm5, XMMWORD PTR [edx-2048]
	{evex} vsm4rnds4	ymm6, ymm5, ymm4
	{evex} vsm4rnds4	xmm6, xmm5, xmm4
	{evex} vsm4rnds4	ymm6, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	{evex} vsm4rnds4	ymm6, ymm5, [ecx]
	{evex} vsm4rnds4	ymm6, ymm5, [ecx+4064]
	{evex} vsm4rnds4	ymm6, ymm5, YMMWORD PTR [edx-4096]
	{evex} vsm4rnds4	xmm6, xmm5, [esp+esi*8+0x10000000]
	{evex} vsm4rnds4	xmm6, xmm5, XMMWORD PTR [ecx]
	{evex} vsm4rnds4	xmm6, xmm5, XMMWORD PTR [ecx+2032]
	{evex} vsm4rnds4	xmm6, xmm5, [edx-2048]
