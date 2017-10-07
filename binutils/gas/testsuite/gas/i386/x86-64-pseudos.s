# Check 64bit instructions with pseudo prefixes for encoding

	.text
_start:
	{vex3} vmovaps %xmm7,%xmm2
	{vex3} {load} vmovaps %xmm7,%xmm2
	{vex3} {store} vmovaps %xmm7,%xmm2
	vmovaps %xmm7,%xmm2
	{vex2} vmovaps %xmm7,%xmm2
	{vex2} {load} vmovaps %xmm7,%xmm2
	{vex2} {store} vmovaps %xmm7,%xmm2
	{vex3} vmovaps (%rax),%xmm2
	vmovaps (%rax),%xmm2
	{vex2} vmovaps (%rax),%xmm2
	{evex} vmovaps (%rax),%xmm2
	{disp32} vmovaps (%rax),%xmm2
	{evex} {disp8} vmovaps (%rax),%xmm2
	{evex} {disp32} vmovaps (%rax),%xmm2
	mov %rcx, %rax
	{load} mov %rcx, %rax
	{store} mov %rcx, %rax
	movaps (%rax),%xmm2
	{load} movaps (%rax),%xmm2
	{store} movaps (%rax),%xmm2
	{disp8} movaps (%rax),%xmm2
	{disp32} movaps (%rax),%xmm2
	movaps -1(%rax),%xmm2
	{disp8} movaps -1(%rax),%xmm2
	{disp32} movaps -1(%rax),%xmm2
	movaps 128(%rax),%xmm2
	{disp8} movaps 128(%rax),%xmm2
	{disp32} movaps 128(%rax),%xmm2

	.intel_syntax noprefix
	{vex3} vmovaps xmm2,xmm7
	{vex3} {load} vmovaps xmm2,xmm7
	{vex3} {store} vmovaps xmm2,xmm7
	vmovaps xmm2,xmm7
	{vex2} vmovaps xmm2,xmm7
	{vex2} {load} vmovaps xmm2,xmm7
	{vex2} {store} vmovaps xmm2,xmm7
	{vex3} vmovaps xmm2,XMMWORD PTR [rax]
	vmovaps xmm2,XMMWORD PTR [rax]
	{vex2} vmovaps xmm2,XMMWORD PTR [rax]
	{evex} vmovaps xmm2,XMMWORD PTR [rax]
	{disp32} vmovaps xmm2,XMMWORD PTR [rax]
	{evex} {disp8} vmovaps xmm2,XMMWORD PTR [rax]
	{evex} {disp32} vmovaps xmm2,XMMWORD PTR [rax]
	mov rax,rcx
	{load} mov rax,rcx
	{store} mov rax,rcx
	movaps xmm2,XMMWORD PTR [rax]
	{load} movaps xmm2,XMMWORD PTR [rax]
	{store} movaps xmm2,XMMWORD PTR [rax]
	{disp8} movaps xmm2,XMMWORD PTR [rax]
	{disp32} movaps xmm2,XMMWORD PTR [rax]
	movaps xmm2,XMMWORD PTR [rax-1]
	{disp8} movaps xmm2,XMMWORD PTR [rax-1]
	{disp32} movaps xmm2,XMMWORD PTR [rax-1]
	movaps xmm2,XMMWORD PTR [rax+128]
	{disp8} movaps xmm2,XMMWORD PTR [rax+128]
	{disp32} movaps xmm2,XMMWORD PTR [rax+128]
