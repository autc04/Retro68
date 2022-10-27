#as:
#objdump: -dw
#name: i386 AVX512VL/VPCLMULQDQ insns
#source: avx512vl_vpclmulqdq.s

.*: +file format .*


Disassembly of section \.text:

00000000 <_start>:
[ 	]*[a-f0-9]+:[ 	]*c4 e3 69 44 da ab[ 	]*vpclmulqdq \$0xab,%xmm2,%xmm2,%xmm3
[ 	]*[a-f0-9]+:[ 	]*c4 e3 69 44 9c f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%xmm2,%xmm3
[ 	]*[a-f0-9]+:[ 	]*c4 e3 69 44 9a f0 07 00 00 7b[ 	]*vpclmulqdq \$0x7b,0x7f0\(%edx\),%xmm2,%xmm3
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 e1 ab[ 	]*vpclmulqdq \$0xab,%ymm1,%ymm5,%ymm4
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 a4 f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%ymm5,%ymm4
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 a2 e0 0f 00 00 7b[ 	]*vpclmulqdq \$0x7b,0xfe0\(%edx\),%ymm5,%ymm4
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 08 44 da ab[ 	]*vpclmulqdq \$0xab,%xmm2,%xmm2,%xmm3
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 08 44 9c f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%xmm2,%xmm3
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 08 44 5a 7f 7b[ 	]*vpclmulqdq \$0x7b,0x7f0\(%edx\),%xmm2,%xmm3
[ 	]*[a-f0-9]+:[ 	]*62 f3 55 28 44 e1 ab[ 	]*vpclmulqdq \$0xab,%ymm1,%ymm5,%ymm4
[ 	]*[a-f0-9]+:[ 	]*62 f3 55 28 44 a4 f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%ymm5,%ymm4
[ 	]*[a-f0-9]+:[ 	]*62 f3 55 28 44 62 7f 7b[ 	]*vpclmulqdq \$0x7b,0xfe0\(%edx\),%ymm5,%ymm4
[ 	]*[a-f0-9]+:[ 	]*c4 e3 51 44 db ab[ 	]*vpclmulqdq \$0xab,%xmm3,%xmm5,%xmm3
[ 	]*[a-f0-9]+:[ 	]*c4 e3 51 44 9c f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%xmm5,%xmm3
[ 	]*[a-f0-9]+:[ 	]*c4 e3 51 44 9a f0 07 00 00 7b[ 	]*vpclmulqdq \$0x7b,0x7f0\(%edx\),%xmm5,%xmm3
[ 	]*[a-f0-9]+:[ 	]*c4 e3 6d 44 d2 ab[ 	]*vpclmulqdq \$0xab,%ymm2,%ymm2,%ymm2
[ 	]*[a-f0-9]+:[ 	]*c4 e3 6d 44 94 f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%ymm2,%ymm2
[ 	]*[a-f0-9]+:[ 	]*c4 e3 6d 44 92 e0 0f 00 00 7b[ 	]*vpclmulqdq \$0x7b,0xfe0\(%edx\),%ymm2,%ymm2
[ 	]*[a-f0-9]+:[ 	]*62 f3 55 08 44 db ab[ 	]*vpclmulqdq \$0xab,%xmm3,%xmm5,%xmm3
[ 	]*[a-f0-9]+:[ 	]*62 f3 55 08 44 9c f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%xmm5,%xmm3
[ 	]*[a-f0-9]+:[ 	]*62 f3 55 08 44 5a 7f 7b[ 	]*vpclmulqdq \$0x7b,0x7f0\(%edx\),%xmm5,%xmm3
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 28 44 d2 ab[ 	]*vpclmulqdq \$0xab,%ymm2,%ymm2,%ymm2
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 28 44 94 f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%ymm2,%ymm2
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 28 44 52 7f 7b[ 	]*vpclmulqdq \$0x7b,0xfe0\(%edx\),%ymm2,%ymm2
#pass
