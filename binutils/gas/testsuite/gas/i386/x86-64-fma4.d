#objdump: -dw
#name: x86-64 FMA4

.*: +file format .*

Disassembly of section .text:

0+ <_start>:
[ 	]*[a-f0-9]+:	c4 e3 cd 69 fc 20    	vfmaddpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 69 39 20    	vfmaddpd \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 68 fc 20    	vfmaddps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 68 39 20    	vfmaddps \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5d fc 20    	vfmaddsubpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5d 39 20    	vfmaddsubpd \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5c fc 20    	vfmaddsubps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5c 39 20    	vfmaddsubps \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 c9 69 fc 20    	vfmaddpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 69 39 20    	vfmaddpd \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 69 39 20    	vfmaddpd %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 68 fc 20    	vfmaddps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 68 39 20    	vfmaddps \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 68 39 20    	vfmaddps %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5d fc 20    	vfmaddsubpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5d 39 20    	vfmaddsubpd \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 5d 39 20    	vfmaddsubpd %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5c fc 20    	vfmaddsubps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5c 39 20    	vfmaddsubps \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 5c 39 20    	vfmaddsubps %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6b fc 20    	vfmaddsd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6b 39 20    	vfmaddsd \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6b 39 20    	vfmaddsd %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6a fc 20    	vfmaddss %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6a 39 20    	vfmaddss \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6a 39 20    	vfmaddss %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 cd 79 fc 20    	vfnmaddpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 79 39 20    	vfnmaddpd \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 78 fc 20    	vfnmaddps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 78 39 20    	vfnmaddps \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7d fc 20    	vfnmsubpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7d 39 20    	vfnmsubpd \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7c fc 20    	vfnmsubps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7c 39 20    	vfnmsubps \(%rcx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 c9 79 fc 20    	vfnmaddpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 79 39 20    	vfnmaddpd \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 79 39 20    	vfnmaddpd %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 78 fc 20    	vfnmaddps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 78 39 20    	vfnmaddps \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 78 39 20    	vfnmaddps %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7d fc 20    	vfnmsubpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7d 39 20    	vfnmsubpd \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7d 39 20    	vfnmsubpd %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7c fc 20    	vfnmsubps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7c 39 20    	vfnmsubps \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7c 39 20    	vfnmsubps %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7b fc 20    	vfnmaddsd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7b 39 20    	vfnmaddsd \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7b 39 20    	vfnmaddsd %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7f fc 20    	vfnmsubsd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7f 39 20    	vfnmsubsd \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7f 39 20    	vfnmsubsd %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7a fc 20    	vfnmaddss %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7a 39 20    	vfnmaddss \(%rcx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7a 39 20    	vfnmaddss %xmm4,\(%rcx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7e fc 20    	vfnmsubss %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7e 39 20    	vfnmsubss \(%rcx\),%xmm6,%xmm2,%xmm7

#pass
