#objdump: -dw
#name: i386 AVX512/4VNNIW_VL insns
#source: avx512_4vnniw_vl.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 09[ 	]*vp4dpwssd \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 52 09[ 	]*vp4dpwssd \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 52 09[ 	]*vp4dpwssd \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8c f4 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 09[ 	]*vp4dpwssd \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f 52 09[ 	]*vp4dpwssd \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af 52 09[ 	]*vp4dpwssd \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8c f4 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 09[ 	]*vp4dpwssds \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 53 09[ 	]*vp4dpwssds \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 53 09[ 	]*vp4dpwssds \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8c f4 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 09[ 	]*vp4dpwssds \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f 53 09[ 	]*vp4dpwssds \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af 53 09[ 	]*vp4dpwssds \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8c f4 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 09[ 	]*vp4dpwssd \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 09[ 	]*vp4dpwssd \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 52 09[ 	]*vp4dpwssd \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 52 09[ 	]*vp4dpwssd \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8c f4 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 09[ 	]*vp4dpwssd \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 09[ 	]*vp4dpwssd \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f 52 09[ 	]*vp4dpwssd \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af 52 09[ 	]*vp4dpwssd \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8c f4 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 09[ 	]*vp4dpwssds \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 09[ 	]*vp4dpwssds \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 53 09[ 	]*vp4dpwssds \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 53 09[ 	]*vp4dpwssds \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8c f4 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 09[ 	]*vp4dpwssds \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 09[ 	]*vp4dpwssds \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f 53 09[ 	]*vp4dpwssds \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af 53 09[ 	]*vp4dpwssds \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8c f4 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%edx\),%ymm4,%ymm1
#pass
