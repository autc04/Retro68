#objdump: -drw
#name: x86-64 pseudo prefxes

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	c4 e1 78 28 d7       	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c4 e1 78 28 d7       	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c4 e1 78 29 fa       	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 29 fa          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c4 e1 78 28 10       	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	c5 f8 28 10          	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	c5 f8 28 10          	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	62 f1 7c 08 28 10    	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	c5 f8 28 90 00 00 00 00 	vmovaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	62 f1 7c 08 28 50 00 	vmovaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	62 f1 7c 08 28 90 00 00 00 00 	vmovaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	48 89 c8             	mov    %rcx,%rax
 +[a-f0-9]+:	48 89 c8             	mov    %rcx,%rax
 +[a-f0-9]+:	48 8b c1             	mov    %rcx,%rax
 +[a-f0-9]+:	0f 28 10             	movaps \(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 10             	movaps \(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 10             	movaps \(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 50 00          	movaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 00 00 00 00 	movaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 50 ff          	movaps -0x1\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 50 ff          	movaps -0x1\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 ff ff ff ff 	movaps -0x1\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 80 00 00 00 	movaps 0x80\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 80 00 00 00 	movaps 0x80\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 80 00 00 00 	movaps 0x80\(%rax\),%xmm2
 +[a-f0-9]+:	c4 e1 78 28 d7       	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c4 e1 78 28 d7       	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c4 e1 78 29 fa       	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c5 f8 29 fa          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	c4 e1 78 28 10       	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	c5 f8 28 10          	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	c5 f8 28 10          	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	62 f1 7c 08 28 10    	vmovaps \(%rax\),%xmm2
 +[a-f0-9]+:	c5 f8 28 90 00 00 00 00 	vmovaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	62 f1 7c 08 28 50 00 	vmovaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	62 f1 7c 08 28 90 00 00 00 00 	vmovaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	48 89 c8             	mov    %rcx,%rax
 +[a-f0-9]+:	48 89 c8             	mov    %rcx,%rax
 +[a-f0-9]+:	48 8b c1             	mov    %rcx,%rax
 +[a-f0-9]+:	0f 28 10             	movaps \(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 10             	movaps \(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 10             	movaps \(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 50 00          	movaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 00 00 00 00 	movaps 0x0\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 50 ff          	movaps -0x1\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 50 ff          	movaps -0x1\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 ff ff ff ff 	movaps -0x1\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 80 00 00 00 	movaps 0x80\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 80 00 00 00 	movaps 0x80\(%rax\),%xmm2
 +[a-f0-9]+:	0f 28 90 80 00 00 00 	movaps 0x80\(%rax\),%xmm2
#pass
