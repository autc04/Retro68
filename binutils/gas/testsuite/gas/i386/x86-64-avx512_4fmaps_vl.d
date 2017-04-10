#objdump: -dw
#name: x86_64 AVX512/4FMAPS_VL insns
#source: x86-64-avx512_4fmaps_vl.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 09[ 	]*v4fmaddps \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f 9a 09[ 	]*v4fmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f 9a 09[ 	]*v4fmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 9a 8c f0 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 09[ 	]*v4fmaddps \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f 9a 09[ 	]*v4fmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af 9a 09[ 	]*v4fmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 9a 8c f0 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 09[ 	]*v4fnmaddps \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f aa 09[ 	]*v4fnmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f aa 09[ 	]*v4fnmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 aa 8c f0 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 09[ 	]*v4fnmaddps \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f aa 09[ 	]*v4fnmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af aa 09[ 	]*v4fnmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 aa 8c f0 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 09[ 	]*v4fmaddps \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 09[ 	]*v4fmaddps \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f 9a 09[ 	]*v4fmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f 9a 09[ 	]*v4fmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 9a 8c f0 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 09[ 	]*v4fmaddps \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 09[ 	]*v4fmaddps \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f 9a 09[ 	]*v4fmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af 9a 09[ 	]*v4fmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 9a 8c f0 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 09[ 	]*v4fnmaddps \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 09[ 	]*v4fnmaddps \(%rcx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 0f aa 09[ 	]*v4fnmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 8f aa 09[ 	]*v4fnmaddps \(%rcx\),%xmm8,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 08 aa 8c f0 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%rax,%r14,8\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 08 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%rdx\),%xmm8,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 09[ 	]*v4fnmaddps \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 09[ 	]*v4fnmaddps \(%rcx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 2f aa 09[ 	]*v4fnmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f af aa 09[ 	]*v4fnmaddps \(%rcx\),%ymm8,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 b2 3f 28 aa 8c f0 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%rax,%r14,8\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%rdx\),%ymm8,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 3f 28 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%rdx\),%ymm8,%ymm1
#pass
