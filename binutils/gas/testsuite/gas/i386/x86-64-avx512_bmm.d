#objdump: -dw
#name: x86-64 AVX512_BMM insns

.*: +file format .*

Disassembly of section \.text:

[0-9a-f]+ <bmm>:
[\s]*[a-f0-9]+:[\s]*62 f6 6c 48 80 d9[\s]*vbmacor16x16x16 %zmm1,%zmm2,%zmm3
[\s]*[a-f0-9]+:[\s]*67 62 f6 74 48 80 94 f4 c0 1d fe ff[\s]*vbmacor16x16x16 -0x1e240\(%esp,%esi,8\),%zmm1,%zmm2
[\s]*[a-f0-9]+:[\s]*67 62 f6 74 48 80 92 00 20 00 00[\s]*vbmacor16x16x16 0x2000\(%edx\),%zmm1,%zmm2
[\s]*[a-f0-9]+:[\s]*67 62 f6 74 48 80 52 80[\s]*vbmacor16x16x16 -0x2000\(%edx\),%zmm1,%zmm2
[\s]*[a-f0-9]+:[\s]*62 f6 ec 48 80 d9[\s]*vbmacxor16x16x16 %zmm1,%zmm2,%zmm3
[\s]*[a-f0-9]+:[\s]*67 62 f6 f4 48 80 94 f4 c0 1d fe ff[\s]*vbmacxor16x16x16 -0x1e240\(%esp,%esi,8\),%zmm1,%zmm2
[\s]*[a-f0-9]+:[\s]*67 62 f6 f4 48 80 92 00 20 00 00[\s]*vbmacxor16x16x16 0x2000\(%edx\),%zmm1,%zmm2
[\s]*[a-f0-9]+:[\s]*67 62 f6 f4 48 80 52 80[\s]*vbmacxor16x16x16 -0x2000\(%edx\),%zmm1,%zmm2
[\s]*[a-f0-9]+:[\s]*62 f6 7c 48 81 d1[\s]*vbitrevb %zmm1,%zmm2
[\s]*[a-f0-9]+:[\s]*62 f6 7c c9 81 d1[\s]*vbitrevb %zmm1,%zmm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*67 62 f6 7c 48 81 94 f4 c0 1d fe ff[\s]*vbitrevb -0x1e240\(%esp,%esi,8\),%zmm2
[\s]*[a-f0-9]+:[\s]*67 62 f6 7c c9 81 94 f4 c0 1d fe ff[\s]*vbitrevb -0x1e240\(%esp,%esi,8\),%zmm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*67 62 f6 7c c9 81 92 00 20 00 00[\s]*vbitrevb 0x2000\(%edx\),%zmm2\{%k1\}\{z\}
[\s]*[a-f0-9]+:[\s]*67 62 f6 7c c9 81 52 80[\s]*vbitrevb -0x2000\(%edx\),%zmm2\{%k1\}\{z\}
#pass
