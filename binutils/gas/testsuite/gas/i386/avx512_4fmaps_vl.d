#objdump: -dw
#name: i386 AVX512/4FMAPS_VL insns
#source: avx512_4fmaps_vl.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 09[ 	]*v4fmaddps \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 9a 09[ 	]*v4fmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 9a 09[ 	]*v4fmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8c f4 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 09[ 	]*v4fmaddps \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f 9a 09[ 	]*v4fmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af 9a 09[ 	]*v4fmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8c f4 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 09[ 	]*v4fnmaddps \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f aa 09[ 	]*v4fnmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f aa 09[ 	]*v4fnmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8c f4 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 09[ 	]*v4fnmaddps \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f aa 09[ 	]*v4fnmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af aa 09[ 	]*v4fnmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8c f4 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 09[ 	]*v4fmaddps \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 09[ 	]*v4fmaddps \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 9a 09[ 	]*v4fmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 9a 09[ 	]*v4fmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8c f4 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 09[ 	]*v4fmaddps \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 09[ 	]*v4fmaddps \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f 9a 09[ 	]*v4fmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af 9a 09[ 	]*v4fmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8c f4 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 09[ 	]*v4fnmaddps \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 09[ 	]*v4fnmaddps \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f aa 09[ 	]*v4fnmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f aa 09[ 	]*v4fnmaddps \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8c f4 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 09[ 	]*v4fnmaddps \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 09[ 	]*v4fnmaddps \(%ecx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 2f aa 09[ 	]*v4fnmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f af aa 09[ 	]*v4fnmaddps \(%ecx\),%ymm4,%ymm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8c f4 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%esp,%esi,8\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%edx\),%ymm4,%ymm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 28 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%edx\),%ymm4,%ymm1
#pass
