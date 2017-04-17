#objdump: -dw
#name: i386 AVX512/4FMAPS insns
#source: avx512_4fmaps.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 09[ 	]*v4fmaddps \(%ecx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 4f 9a 09[ 	]*v4fmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f cf 9a 09[ 	]*v4fmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8c f4 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%esp,%esi,8\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 09[ 	]*v4fnmaddps \(%ecx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 4f aa 09[ 	]*v4fnmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f cf aa 09[ 	]*v4fnmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8c f4 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%esp,%esi,8\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 09[ 	]*v4fmaddss \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 9b 09[ 	]*v4fmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 9b 09[ 	]*v4fmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8c f4 c0 1d fe ff[ 	]*v4fmaddss -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a e0 0f 00 00[ 	]*v4fmaddss 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a 00 10 00 00[ 	]*v4fmaddss 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a 00 f0 ff ff[ 	]*v4fmaddss -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a e0 ef ff ff[ 	]*v4fmaddss -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 09[ 	]*v4fnmaddss \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f ab 09[ 	]*v4fnmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f ab 09[ 	]*v4fnmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8c f4 c0 1d fe ff[ 	]*v4fnmaddss -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a e0 0f 00 00[ 	]*v4fnmaddss 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a 00 10 00 00[ 	]*v4fnmaddss 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a 00 f0 ff ff[ 	]*v4fnmaddss -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a e0 ef ff ff[ 	]*v4fnmaddss -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 09[ 	]*v4fmaddps \(%ecx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 09[ 	]*v4fmaddps \(%ecx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 4f 9a 09[ 	]*v4fmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f cf 9a 09[ 	]*v4fmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8c f4 c0 1d fe ff[ 	]*v4fmaddps -0x1e240\(%esp,%esi,8\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a e0 0f 00 00[ 	]*v4fmaddps 0xfe0\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a 00 10 00 00[ 	]*v4fmaddps 0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a 00 f0 ff ff[ 	]*v4fmaddps -0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 9a 8a e0 ef ff ff[ 	]*v4fmaddps -0x1020\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 09[ 	]*v4fnmaddps \(%ecx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 09[ 	]*v4fnmaddps \(%ecx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 4f aa 09[ 	]*v4fnmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f cf aa 09[ 	]*v4fnmaddps \(%ecx\),%zmm4,%zmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8c f4 c0 1d fe ff[ 	]*v4fnmaddps -0x1e240\(%esp,%esi,8\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a e0 0f 00 00[ 	]*v4fnmaddps 0xfe0\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a 00 10 00 00[ 	]*v4fnmaddps 0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a 00 f0 ff ff[ 	]*v4fnmaddps -0x1000\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 48 aa 8a e0 ef ff ff[ 	]*v4fnmaddps -0x1020\(%edx\),%zmm4,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 09[ 	]*v4fmaddss \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 09[ 	]*v4fmaddss \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f 9b 09[ 	]*v4fmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f 9b 09[ 	]*v4fmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8c f4 c0 1d fe ff[ 	]*v4fmaddss -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a e0 0f 00 00[ 	]*v4fmaddss 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a 00 10 00 00[ 	]*v4fmaddss 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a 00 f0 ff ff[ 	]*v4fmaddss -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 9b 8a e0 ef ff ff[ 	]*v4fmaddss -0x1020\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 09[ 	]*v4fnmaddss \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 09[ 	]*v4fnmaddss \(%ecx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 0f ab 09[ 	]*v4fnmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 8f ab 09[ 	]*v4fnmaddss \(%ecx\),%xmm4,%xmm1\{%k7\}\{z\}
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8c f4 c0 1d fe ff[ 	]*v4fnmaddss -0x1e240\(%esp,%esi,8\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a e0 0f 00 00[ 	]*v4fnmaddss 0xfe0\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a 00 10 00 00[ 	]*v4fnmaddss 0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a 00 f0 ff ff[ 	]*v4fnmaddss -0x1000\(%edx\),%xmm4,%xmm1
[ 	]*[a-f0-9]+:[ 	]*62 f2 5f 08 ab 8a e0 ef ff ff[ 	]*v4fnmaddss -0x1020\(%edx\),%xmm4,%xmm1
#pass
