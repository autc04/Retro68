#as:
#objdump: -dw
#name: x86_64 VPCLMULQDQ insns
#source: x86-64-vpclmulqdq.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 03 15 20 44 f4 ab[ 	]*vpclmulqdq \$0xab,%ymm28,%ymm29,%ymm30
[ 	]*[a-f0-9]+:[ 	]*62 23 15 20 44 b4 f0 24 01 00 00 7b[ 	]*vpclmulqdq \$0x7b,0x124\(%rax,%r14,8\),%ymm29,%ymm30
[ 	]*[a-f0-9]+:[ 	]*62 63 15 20 44 72 7f 7b[ 	]*vpclmulqdq \$0x7b,0xfe0\(%rdx\),%ymm29,%ymm30
[ 	]*[a-f0-9]+:[ 	]*62 03 15 20 44 f4 ab[ 	]*vpclmulqdq \$0xab,%ymm28,%ymm29,%ymm30
[ 	]*[a-f0-9]+:[ 	]*62 23 15 20 44 b4 f0 34 12 00 00 7b[ 	]*vpclmulqdq \$0x7b,0x1234\(%rax,%r14,8\),%ymm29,%ymm30
[ 	]*[a-f0-9]+:[ 	]*62 63 15 20 44 72 7f 7b[ 	]*vpclmulqdq \$0x7b,0xfe0\(%rdx\),%ymm29,%ymm30
#pass
