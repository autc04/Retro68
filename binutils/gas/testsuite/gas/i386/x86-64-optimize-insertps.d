#as: -O -msse2avx
#objdump: -drw
#name: x86-64 EXTRACTPS optimized encoding with -msse2avx

.*: +file format .*


Disassembly of section .text:

0+ <insertps>:
 +[a-f0-9]+:	c5 ea 10 d1          	vmovss %xmm1,%xmm2,%xmm2
 +[a-f0-9]+:	c5 fa 10 11          	vmovss \(%rcx\),%xmm2
 +[a-f0-9]+:	62 f9 7e 08 10 11    	vmovss \(%r17\),%xmm2
 +[a-f0-9]+:	c5 e8 57 d2          	vxorps %xmm2,%xmm2,%xmm2
 +[a-f0-9]+:	c5 ea 10 d9          	vmovss %xmm1,%xmm2,%xmm3
 +[a-f0-9]+:	c5 fa 10 11          	vmovss \(%rcx\),%xmm2
 +[a-f0-9]+:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 +[a-f0-9]+:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 +[a-f0-9]+:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 +[a-f0-9]+:	c5 60 57 db          	vxorps %xmm3,%xmm3,%xmm11
 +[a-f0-9]+:	62 b1 6e 08 10 d9    	vmovss %xmm17,%xmm2,%xmm3
 +[a-f0-9]+:	62 e1 7e 08 10 11    	vmovss \(%rcx\),%xmm18
 +[a-f0-9]+:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 +[a-f0-9]+:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 +[a-f0-9]+:	62 a1 64 00 57 db    	vxorps %xmm19,%xmm19,%xmm19
#pass
