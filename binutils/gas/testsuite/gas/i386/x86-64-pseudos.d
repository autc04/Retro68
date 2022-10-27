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
 +[a-f0-9]+:	88 c4                	mov    %al,%ah
 +[a-f0-9]+:	40 89 c3             	rex mov %eax,%ebx
 +[a-f0-9]+:	41 89 c6             	mov    %eax,%r14d
 +[a-f0-9]+:	41 89 00             	mov    %eax,\(%r8\)
 +[a-f0-9]+:	40 0f 28 d7          	rex movaps %xmm7,%xmm2
 +[a-f0-9]+:	44 0f 28 e7          	movaps %xmm7,%xmm12
 +[a-f0-9]+:	40 0f 28 11          	rex movaps \(%rcx\),%xmm2
 +[a-f0-9]+:	41 0f 28 10          	movaps \(%r8\),%xmm2
 +[a-f0-9]+:	40 0f 38 01 01       	rex phaddw \(%rcx\),%mm0
 +[a-f0-9]+:	41 0f 38 01 00       	phaddw \(%r8\),%mm0
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	62 b1 7c 08 28 d1    	vmovaps %xmm17,%xmm2
 +[a-f0-9]+:	c4 e3 7b f0 d8 07    	rorx   \$0x7,%eax,%ebx
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
 +[a-f0-9]+:	88 c4                	mov    %al,%ah
 +[a-f0-9]+:	40 89 c3             	rex mov %eax,%ebx
 +[a-f0-9]+:	41 89 c6             	mov    %eax,%r14d
 +[a-f0-9]+:	41 89 00             	mov    %eax,\(%r8\)
 +[a-f0-9]+:	40 0f 28 d7          	rex movaps %xmm7,%xmm2
 +[a-f0-9]+:	44 0f 28 e7          	movaps %xmm7,%xmm12
 +[a-f0-9]+:	40 0f 28 11          	rex movaps \(%rcx\),%xmm2
 +[a-f0-9]+:	41 0f 28 10          	movaps \(%r8\),%xmm2
 +[a-f0-9]+:	40 0f 38 01 01       	rex phaddw \(%rcx\),%mm0
 +[a-f0-9]+:	41 0f 38 01 00       	phaddw \(%r8\),%mm0
 +[a-f0-9]+:	c5 f8 28 d7          	vmovaps %xmm7,%xmm2
 +[a-f0-9]+:	62 b1 7c 08 28 d1    	vmovaps %xmm17,%xmm2
 +[a-f0-9]+:	c4 e3 7b f0 d8 07    	rorx   \$0x7,%eax,%ebx
#pass
