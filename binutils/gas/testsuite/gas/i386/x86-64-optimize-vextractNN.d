#as: -O
#objdump: -drw
#name: x86-64 VEXTRACT{F,I}<nn> optimized encoding with -msse2avx

.*: +file format .*


Disassembly of section .text:

0+ <vextract_128>:
 +[a-f0-9]+:	c5 f8 29 ca          	vmovaps %xmm1,%xmm2
 +[a-f0-9]+:	c5 f8 11 0a          	vmovups %xmm1,\(%rdx\)
 +[a-f0-9]+:	c5 f9 7f ca          	vmovdqa %xmm1,%xmm2
 +[a-f0-9]+:	c5 fa 7f 0a          	vmovdqu %xmm1,\(%rdx\)

0+[a-f0-9]+ <vextract_NNxM_XMM>:
 +[a-f0-9]+:	c5 f8 29 ca          	vmovaps %xmm1,%xmm2
 +[a-f0-9]+:	c5 f8 11 0a          	vmovups %xmm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 7c 08 29 ca    	vmovaps %xmm17,%xmm2
 +[a-f0-9]+:	62 e1 7c 08 11 0a    	vmovups %xmm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 7c 08 11 0a    	vmovups %xmm1,\(%r18\)
 +[a-f0-9]+:	c5 f9 29 ca          	vmovapd %xmm1,%xmm2
 +[a-f0-9]+:	c5 f9 11 0a          	vmovupd %xmm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 fd 08 29 ca    	vmovapd %xmm17,%xmm2
 +[a-f0-9]+:	62 e1 fd 08 11 0a    	vmovupd %xmm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 fd 08 11 0a    	vmovupd %xmm1,\(%r18\)
 +[a-f0-9]+:	c5 f9 7f ca          	vmovdqa %xmm1,%xmm2
 +[a-f0-9]+:	c5 fa 7f 0a          	vmovdqu %xmm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 7d 08 7f ca    	vmovdqa32 %xmm17,%xmm2
 +[a-f0-9]+:	62 e1 7e 08 7f 0a    	vmovdqu32 %xmm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 7e 08 7f 0a    	vmovdqu32 %xmm1,\(%r18\)
 +[a-f0-9]+:	c5 f9 7f ca          	vmovdqa %xmm1,%xmm2
 +[a-f0-9]+:	c5 fa 7f 0a          	vmovdqu %xmm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 fd 08 7f ca    	vmovdqa64 %xmm17,%xmm2
 +[a-f0-9]+:	62 e1 fe 08 7f 0a    	vmovdqu64 %xmm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 fe 08 7f 0a    	vmovdqu64 %xmm1,\(%r18\)

0+[a-f0-9]+ <vextract_NNxM_YMM>:
 +[a-f0-9]+:	c5 fc 29 ca          	vmovaps %ymm1,%ymm2
 +[a-f0-9]+:	c5 fc 11 0a          	vmovups %ymm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 7c 28 29 ca    	vmovaps %ymm17,%ymm2
 +[a-f0-9]+:	62 e1 7c 28 11 0a    	vmovups %ymm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 7c 28 11 0a    	vmovups %ymm1,\(%r18\)
 +[a-f0-9]+:	c5 fd 29 ca          	vmovapd %ymm1,%ymm2
 +[a-f0-9]+:	c5 fd 11 0a          	vmovupd %ymm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 fd 28 29 ca    	vmovapd %ymm17,%ymm2
 +[a-f0-9]+:	62 e1 fd 28 11 0a    	vmovupd %ymm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 fd 28 11 0a    	vmovupd %ymm1,\(%r18\)
 +[a-f0-9]+:	c5 fd 7f ca          	vmovdqa %ymm1,%ymm2
 +[a-f0-9]+:	c5 fe 7f 0a          	vmovdqu %ymm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 7d 28 7f ca    	vmovdqa32 %ymm17,%ymm2
 +[a-f0-9]+:	62 e1 7e 28 7f 0a    	vmovdqu32 %ymm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 7e 28 7f 0a    	vmovdqu32 %ymm1,\(%r18\)
 +[a-f0-9]+:	c5 fd 7f ca          	vmovdqa %ymm1,%ymm2
 +[a-f0-9]+:	c5 fe 7f 0a          	vmovdqu %ymm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 fd 28 7f ca    	vmovdqa64 %ymm17,%ymm2
 +[a-f0-9]+:	62 e1 fe 28 7f 0a    	vmovdqu64 %ymm17,\(%rdx\)
 +[a-f0-9]+:	62 f9 fe 28 7f 0a    	vmovdqu64 %ymm1,\(%r18\)
#pass
