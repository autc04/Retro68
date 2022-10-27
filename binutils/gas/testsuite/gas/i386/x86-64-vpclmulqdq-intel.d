#as:
#objdump: -dw -Mintel
#name: x86_64 VPCLMULQDQ insns (Intel disassembly)
#source: x86-64-vpclmulqdq.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 03 15 20 44 f4 ab[ 	]*vpclmulqdq ymm30,ymm29,ymm28,0xab
[ 	]*[a-f0-9]+:[ 	]*62 23 15 20 44 b4 f0 24 01 00 00 7b[ 	]*vpclmulqdq ymm30,ymm29,YMMWORD PTR \[rax\+r14\*8\+0x124\],0x7b
[ 	]*[a-f0-9]+:[ 	]*62 63 15 20 44 72 7f 7b[ 	]*vpclmulqdq ymm30,ymm29,YMMWORD PTR \[rdx\+0xfe0\],0x7b
[ 	]*[a-f0-9]+:[ 	]*62 03 15 20 44 f4 ab[ 	]*vpclmulqdq ymm30,ymm29,ymm28,0xab
[ 	]*[a-f0-9]+:[ 	]*62 23 15 20 44 b4 f0 34 12 00 00 7b[ 	]*vpclmulqdq ymm30,ymm29,YMMWORD PTR \[rax\+r14\*8\+0x1234\],0x7b
[ 	]*[a-f0-9]+:[ 	]*62 63 15 20 44 72 7f 7b[ 	]*vpclmulqdq ymm30,ymm29,YMMWORD PTR \[rdx\+0xfe0\],0x7b
#pass
