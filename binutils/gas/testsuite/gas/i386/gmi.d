#objdump: -dw
#name: zhaoxin gmi

.*: +file format .*

Disassembly of section .text:

0+000 <foo>:
   0:[	 ]*f2 0f a6 c0 [	 ]*sm2
   4:[	 ]*f3 0f a6 e8 [	 ]*sm3
   8:[	 ]*f3 0f a7 f0 [	 ]*sm4
#pass
