#objdump: -dw
#name: x86_64 AVX512/4VNNIW_VL insns
#source: x86-64-avx512_4vnniw_vl.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 09[ 	]*vp4dpwssd \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f 52 09[ 	]*vp4dpwssd \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f 52 09[ 	]*vp4dpwssd \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 52 8c f0 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 09[ 	]*vp4dpwssd \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f 52 09[ 	]*vp4dpwssd \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af 52 09[ 	]*vp4dpwssd \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 52 8c f0 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 09[ 	]*vp4dpwssds \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f 53 09[ 	]*vp4dpwssds \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f 53 09[ 	]*vp4dpwssds \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 53 8c f0 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 09[ 	]*vp4dpwssds \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f 53 09[ 	]*vp4dpwssds \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af 53 09[ 	]*vp4dpwssds \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 53 8c f0 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 09[ 	]*vp4dpwssd \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 09[ 	]*vp4dpwssd \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f 52 09[ 	]*vp4dpwssd \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f 52 09[ 	]*vp4dpwssd \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 52 8c f0 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 09[ 	]*vp4dpwssd \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 09[ 	]*vp4dpwssd \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f 52 09[ 	]*vp4dpwssd \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af 52 09[ 	]*vp4dpwssd \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 52 8c f0 c0 1d fe ff[ 	]*vp4dpwssd -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a e0 0f 00 00[ 	]*vp4dpwssd 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a 00 10 00 00[ 	]*vp4dpwssd 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a 00 f0 ff ff[ 	]*vp4dpwssd -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 52 8a e0 ef ff ff[ 	]*vp4dpwssd -0x1020\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 09[ 	]*vp4dpwssds \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 09[ 	]*vp4dpwssds \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f 53 09[ 	]*vp4dpwssds \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f 53 09[ 	]*vp4dpwssds \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 53 8c f0 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 09[ 	]*vp4dpwssds \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 09[ 	]*vp4dpwssds \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f 53 09[ 	]*vp4dpwssds \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af 53 09[ 	]*vp4dpwssds \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 53 8c f0 c0 1d fe ff[ 	]*vp4dpwssds -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a e0 0f 00 00[ 	]*vp4dpwssds 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a 00 10 00 00[ 	]*vp4dpwssds 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a 00 f0 ff ff[ 	]*vp4dpwssds -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 53 8a e0 ef ff ff[ 	]*vp4dpwssds -0x1020\(%rdx\),%ymm8,%ymm1
#pass
