#objdump: -dw
#name: i386 AVX512_BMM,AVX512VL insns

.*: +file format .*

Disassembly of section \.text:

[0-9a-f]+ <bmm>:
[\s]*[a-f0-9]+:[\s]*62 f6 6c 28 80 d9[\s]*vbmacor16x16x16 %ymm1,%ymm2,%ymm3
[\s]*[a-f0-9]+:[\s]*62 f6 74 28 80 94 f4 c0 1d fe ff[\s]*vbmacor16x16x16 -0x1e240\(%esp,%esi,8\),%ymm1,%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 74 28 80 92 00 10 00 00[\s]*vbmacor16x16x16 0x1000\(%edx\),%ymm1,%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 74 28 80 52 80[\s]*vbmacor16x16x16 -0x1000\(%edx\),%ymm1,%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 ec 28 80 d9[\s]*vbmacxor16x16x16 %ymm1,%ymm2,%ymm3
[\s]*[a-f0-9]+:[\s]*62 f6 f4 28 80 94 f4 c0 1d fe ff[\s]*vbmacxor16x16x16 -0x1e240\(%esp,%esi,8\),%ymm1,%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 f4 28 80 92 00 10 00 00[\s]*vbmacxor16x16x16 0x1000\(%edx\),%ymm1,%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 f4 28 80 52 80[\s]*vbmacxor16x16x16 -0x1000\(%edx\),%ymm1,%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 7c 08 81 d1[\s]*vbitrevb %xmm1,%xmm2
[\s]*[a-f0-9]+:[\s]*62 f6 7c 89 81 d1[\s]*vbitrevb %xmm1,%xmm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*62 f6 7c 08 81 94 f4 c0 1d fe ff[\s]*vbitrevb -0x1e240\(%esp,%esi,8\),%xmm2
[\s]*[a-f0-9]+:[\s]*62 f6 7c 89 81 94 f4 c0 1d fe ff[\s]*vbitrevb -0x1e240\(%esp,%esi,8\),%xmm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*62 f6 7c 89 81 92 00 08 00 00[\s]*vbitrevb 0x800\(%edx\),%xmm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*62 f6 7c 89 81 52 80[\s]*vbitrevb -0x800\(%edx\),%xmm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*62 f6 7c 28 81 d1[\s]*vbitrevb %ymm1,%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 7c a9 81 d1[\s]*vbitrevb %ymm1,%ymm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*62 f6 7c 28 81 94 f4 c0 1d fe ff[\s]*vbitrevb -0x1e240\(%esp,%esi,8\),%ymm2
[\s]*[a-f0-9]+:[\s]*62 f6 7c a9 81 94 f4 c0 1d fe ff[\s]*vbitrevb -0x1e240\(%esp,%esi,8\),%ymm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*62 f6 7c a9 81 90 00 10 00 00[\s]*vbitrevb 0x1000\(%eax\),%ymm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*62 f6 7c a9 81 50 80[\s]*vbitrevb -0x1000\(%eax\),%ymm2\{%k1\}\{z\}
#pass
