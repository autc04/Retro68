#as: -O -msse2avx
#objdump: -drw
#name: x86-64 EXTRACTPS optimized encoding with -msse2avx

.*: +file format .*


Disassembly of section .text:

0+ <extractps>:
 +[a-f0-9]+:	c5 f9 7e ca          	vmovd  %xmm1,%edx
 +[a-f0-9]+:	c5 fa 11 0a          	vmovss %xmm1,\(%rdx\)
 +[a-f0-9]+:	62 f9 7d 08 7e ca    	vmovd  %xmm1,%r18d
 +[a-f0-9]+:	62 f9 7e 08 11 0a    	vmovss %xmm1,\(%r18\)
 +[a-f0-9]+:	c5 f9 7e ca          	vmovd  %xmm1,%edx
 +[a-f0-9]+:	c5 fa 11 0a          	vmovss %xmm1,\(%rdx\)
 +[a-f0-9]+:	62 e1 7d 08 7e ca    	vmovd  %xmm17,%edx
 +[a-f0-9]+:	62 f9 7d 08 7e ca    	vmovd  %xmm1,%r18d
 +[a-f0-9]+:	62 f9 7e 08 11 0a    	vmovss %xmm1,\(%r18\)
#pass
