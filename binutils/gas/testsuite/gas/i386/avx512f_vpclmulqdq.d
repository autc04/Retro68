#as:
#objdump: -dw
#name: i386 AVX512F/VPCLMULQDQ insns
#source: avx512f_vpclmulqdq.s

.*: +file format .*


Disassembly of section \.text:

00000000 <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 f3 65 48 44 c9 ab[ 	]*vpclmulqdq \$0xab,%zmm1,%zmm3,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f3 65 48 44 8c f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%zmm3,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f3 65 48 44 4a 7f 7b[ 	]*vpclmulqdq \$0x7b,0x1fc0\(%edx\),%zmm3,%zmm1
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 48 44 d2 ab[ 	]*vpclmulqdq \$0xab,%zmm2,%zmm2,%zmm2
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 48 44 94 f4 c0 1d fe ff 7b[ 	]*vpclmulqdq \$0x7b,-0x1e240\(%esp,%esi,8\),%zmm2,%zmm2
[ 	]*[a-f0-9]+:[ 	]*62 f3 6d 48 44 52 7f 7b[ 	]*vpclmulqdq \$0x7b,0x1fc0\(%edx\),%zmm2,%zmm2
#pass
