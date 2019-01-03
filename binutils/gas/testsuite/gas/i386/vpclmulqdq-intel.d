#as:
#objdump: -dw -Mintel
#name: i386 VPCLMULQDQ insns (Intel disassembly)
#source: vpclmulqdq.s

.*: +file format .*


Disassembly of section \.text:

00000000 <_start>:
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 f4 ab[ 	]*vpclmulqdq ymm6,ymm5,ymm4,0xab
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 b4 f4 c0 1d fe ff 7b[ 	]*vpclmulqdq ymm6,ymm5,YMMWORD PTR \[esp\+esi\*8-0x1e240\],0x7b
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 b2 e0 0f 00 00 7b[ 	]*vpclmulqdq ymm6,ymm5,YMMWORD PTR \[edx\+0xfe0\],0x7b
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 f4 ab[ 	]*vpclmulqdq ymm6,ymm5,ymm4,0xab
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 b4 f4 c0 1d fe ff 7b[ 	]*vpclmulqdq ymm6,ymm5,YMMWORD PTR \[esp\+esi\*8-0x1e240\],0x7b
[ 	]*[a-f0-9]+:[ 	]*c4 e3 55 44 b2 e0 0f 00 00 7b[ 	]*vpclmulqdq ymm6,ymm5,YMMWORD PTR \[edx\+0xfe0\],0x7b
#pass
