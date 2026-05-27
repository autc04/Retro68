#source: arch-16.s
#as: -march=znver6
#objdump: -dw
#name: i386 arch 16 (znver6)

.*: +file format .*

Disassembly of section \.text:

[0-9a-f]+ <\.text>:
[\s]*[a-f0-9]+:[\s]*62 f6 6c 28 80 d9[\s]*vbmacor16x16x16 %ymm1,%ymm2,%ymm3
[\s]*[a-f0-9]+:[\s]*c4 e2 7a b1 0a[\s]*vbcstnebf162ps \(%edx\),%xmm1
[\s]*[a-f0-9]+:[\s]*c4 e2 f1 b5 d1[\s]*\{vex\} vpmadd52huq %xmm1,%xmm1,%xmm2
[\s]*[a-f0-9]+:[\s]*c4 e2 6f 50 d9[\s]*vpdpbssd %ymm1,%ymm2,%ymm3
[\s]*[a-f0-9]+:[\s]*62 f5 6c 48 58 d9[\s]*vaddph %zmm1,%zmm2,%zmm3
#pass
