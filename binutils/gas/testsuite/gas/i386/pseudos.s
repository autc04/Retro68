# Check instructions with pseudo prefixes for encoding

	.text
_start:
	{vex3} vmovaps %xmm7,%xmm2
	{vex3} {load} vmovaps %xmm7,%xmm2
	{vex3} {store} vmovaps %xmm7,%xmm2
	vmovaps %xmm7,%xmm2
	{vex2} vmovaps %xmm7,%xmm2
	{vex2} {load} vmovaps %xmm7,%xmm2
	{vex2} {store} vmovaps %xmm7,%xmm2
	{vex3} vmovaps (%eax),%xmm2
	vmovaps (%eax),%xmm2
	{vex2} vmovaps (%eax),%xmm2
	{evex} vmovaps (%eax),%xmm2
	{disp32} vmovaps (%eax),%xmm2
	{evex} {disp8} vmovaps (%eax),%xmm2
	{evex} {disp32} vmovaps (%eax),%xmm2
	mov %ecx, %eax
	{load} mov %ecx, %eax
	{store} mov %ecx, %eax
	movaps (%eax),%xmm2
	{load} movaps (%eax),%xmm2
	{store} movaps (%eax),%xmm2
	{disp8} movaps (%eax),%xmm2
	{disp32} movaps (%eax),%xmm2
	movaps -1(%eax),%xmm2
	{disp8} movaps -1(%eax),%xmm2
	{disp32} movaps -1(%eax),%xmm2
	movaps 128(%eax),%xmm2
	{disp8} movaps 128(%eax),%xmm2
	{disp32} movaps 128(%eax),%xmm2

	.intel_syntax noprefix
	{vex3} vmovaps xmm2,xmm7
	{vex3} {load} vmovaps xmm2,xmm7
	{vex3} {store} vmovaps xmm2,xmm7
	vmovaps xmm2,xmm7
	{vex2} vmovaps xmm2,xmm7
	{vex2} {load} vmovaps xmm2,xmm7
	{vex2} {store} vmovaps xmm2,xmm7
	{vex3} vmovaps xmm2,XMMWORD PTR [eax]
	vmovaps xmm2,XMMWORD PTR [eax]
	{vex2} vmovaps xmm2,XMMWORD PTR [eax]
	{evex} vmovaps xmm2,XMMWORD PTR [eax]
	{disp32} vmovaps xmm2,XMMWORD PTR [eax]
	{evex} {disp8} vmovaps xmm2,XMMWORD PTR [eax]
	{evex} {disp32} vmovaps xmm2,XMMWORD PTR [eax]
	mov eax,ecx
	{load} mov eax,ecx
	{store} mov eax,ecx
	movaps xmm2,XMMWORD PTR [eax]
	{load} movaps xmm2,XMMWORD PTR [eax]
	{store} movaps xmm2,XMMWORD PTR [eax]
	{disp8} movaps xmm2,XMMWORD PTR [eax]
	{disp32} movaps xmm2,XMMWORD PTR [eax]
	movaps xmm2,XMMWORD PTR [eax-1]
	{disp8} movaps xmm2,XMMWORD PTR [eax-1]
	{disp32} movaps xmm2,XMMWORD PTR [eax-1]
	movaps xmm2,XMMWORD PTR [eax+128]
	{disp8} movaps xmm2,XMMWORD PTR [eax+128]
	{disp32} movaps xmm2,XMMWORD PTR [eax+128]
