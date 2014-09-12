#as: -moperand-check=error -I${srcdir}/$subdir
#objdump: -dw
#name: x86-64 vgather check (.operand_check none)

.*:     file format .*

Disassembly of section .text:

0+ <vgather>:
[ 	]*[a-f0-9]+:[ 	]+c4 e2 69 92 04 08[ 	]+vgatherdps %xmm2,\(%rax,%xmm1,1\),%xmm0
[ 	]*[a-f0-9]+:[ 	]+c4 e2 69 92 14 48[ 	]+vgatherdps %xmm2,\(%rax,%xmm1,2\),%xmm2
[ 	]*[a-f0-9]+:[ 	]+c4 62 69 92 14 48[ 	]+vgatherdps %xmm2,\(%rax,%xmm1,2\),%xmm10
[ 	]*[a-f0-9]+:[ 	]+c4 e2 71 92 04 88[ 	]+vgatherdps %xmm1,\(%rax,%xmm1,4\),%xmm0
[ 	]*[a-f0-9]+:[ 	]+c4 e2 31 92 04 88[ 	]+vgatherdps %xmm9,\(%rax,%xmm1,4\),%xmm0
[ 	]*[a-f0-9]+:[ 	]+c4 e2 69 92 0c c8[ 	]+vgatherdps %xmm2,\(%rax,%xmm1,8\),%xmm1
[ 	]*[a-f0-9]+:[ 	]+c4 62 69 92 0c c8[ 	]+vgatherdps %xmm2,\(%rax,%xmm1,8\),%xmm9
#pass
