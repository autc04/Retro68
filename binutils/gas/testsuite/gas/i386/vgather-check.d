#as: -moperand-check=none
#objdump: -dw
#name: i386 vgather check (-moperand-check=none)

.*:     file format .*

Disassembly of section .text:

0+ <vgather>:
[ 	]*[a-f0-9]+:[ 	]+c4 e2 69 92 04 08[ 	]+vgatherdps %xmm2,\(%eax,%xmm1,1\),%xmm0
[ 	]*[a-f0-9]+:[ 	]+c4 e2 69 92 14 48[ 	]+vgatherdps %xmm2,\(%eax,%xmm1,2\),%xmm2
[ 	]*[a-f0-9]+:[ 	]+c4 e2 71 92 04 88[ 	]+vgatherdps %xmm1,\(%eax,%xmm1,4\),%xmm0
[ 	]*[a-f0-9]+:[ 	]+c4 e2 69 92 0c c8[ 	]+vgatherdps %xmm2,\(%eax,%xmm1,8\),%xmm1
#pass
