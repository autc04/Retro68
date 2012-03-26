#objdump: -dw
#name: i386 FMA4

.*:     file format .*

Disassembly of section .text:

0+ <_start>:
[ 	]*[a-f0-9]+:	c4 e3 cd 69 fc 20    	vfmaddpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 69 39 20    	vfmaddpd \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 68 fc 20    	vfmaddps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 68 39 20    	vfmaddps \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5d fc 20    	vfmaddsubpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5d 39 20    	vfmaddsubpd \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5c fc 20    	vfmaddsubps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5c 39 20    	vfmaddsubps \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5f fc 20    	vfmsubaddpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5f 39 20    	vfmsubaddpd \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5e fc 20    	vfmsubaddps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 5e 39 20    	vfmsubaddps \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 6d fc 20    	vfmsubpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 6d 39 20    	vfmsubpd \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 6c fc 20    	vfmsubps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 6c 39 20    	vfmsubps \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 c9 69 fc 20    	vfmaddpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 69 39 20    	vfmaddpd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 69 39 20    	vfmaddpd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 68 fc 20    	vfmaddps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 68 39 20    	vfmaddps \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 68 39 20    	vfmaddps %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5d fc 20    	vfmaddsubpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5d 39 20    	vfmaddsubpd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 5d 39 20    	vfmaddsubpd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5c fc 20    	vfmaddsubps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5c 39 20    	vfmaddsubps \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 5c 39 20    	vfmaddsubps %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5f fc 20    	vfmsubaddpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5f 39 20    	vfmsubaddpd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 5f 39 20    	vfmsubaddpd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5e fc 20    	vfmsubaddps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 5e 39 20    	vfmsubaddps \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 5e 39 20    	vfmsubaddps %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6d fc 20    	vfmsubpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6d 39 20    	vfmsubpd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6d 39 20    	vfmsubpd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6c fc 20    	vfmsubps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6c 39 20    	vfmsubps \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6c 39 20    	vfmsubps %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6b fc 20    	vfmaddsd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6b 39 20    	vfmaddsd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6b 39 20    	vfmaddsd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6f fc 20    	vfmsubsd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6f 39 20    	vfmsubsd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6f 39 20    	vfmsubsd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6a fc 20    	vfmaddss %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6a 39 20    	vfmaddss \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6a 39 20    	vfmaddss %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6e fc 20    	vfmsubss %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 6e 39 20    	vfmsubss \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 6e 39 20    	vfmsubss %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 cd 79 fc 20    	vfnmaddpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 79 39 20    	vfnmaddpd \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 78 fc 20    	vfnmaddps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 78 39 20    	vfnmaddps \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7d fc 20    	vfnmsubpd %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7d 39 20    	vfnmsubpd \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7c fc 20    	vfnmsubps %ymm4,%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 cd 7c 39 20    	vfnmsubps \(%ecx\),%ymm6,%ymm2,%ymm7
[ 	]*[a-f0-9]+:	c4 e3 c9 79 fc 20    	vfnmaddpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 79 39 20    	vfnmaddpd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 79 39 20    	vfnmaddpd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 78 fc 20    	vfnmaddps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 78 39 20    	vfnmaddps \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 78 39 20    	vfnmaddps %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7d fc 20    	vfnmsubpd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7d 39 20    	vfnmsubpd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7d 39 20    	vfnmsubpd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7c fc 20    	vfnmsubps %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7c 39 20    	vfnmsubps \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7c 39 20    	vfnmsubps %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7b fc 20    	vfnmaddsd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7b 39 20    	vfnmaddsd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7b 39 20    	vfnmaddsd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7f fc 20    	vfnmsubsd %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7f 39 20    	vfnmsubsd \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7f 39 20    	vfnmsubsd %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7a fc 20    	vfnmaddss %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7a 39 20    	vfnmaddss \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7a 39 20    	vfnmaddss %xmm4,\(%ecx\),%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7e fc 20    	vfnmsubss %xmm4,%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 c9 7e 39 20    	vfnmsubss \(%ecx\),%xmm6,%xmm2,%xmm7
[ 	]*[a-f0-9]+:	c4 e3 59 7e 39 20    	vfnmsubss %xmm4,\(%ecx\),%xmm2,%xmm7
#pass
