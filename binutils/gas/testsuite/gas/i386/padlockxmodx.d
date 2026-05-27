#objdump: -dw
#name: Zhaoxin PadLock XMODX

.*: +file format .*

Disassembly of section .text:

0+000 <foo>:
   0:[	 ]*f3 0f a6 f0 [	 ]*repz montmul2
   4:[	 ]*f3 0f a6 f0 [	 ]*repz montmul2
   8:[	 ]*f3 0f a6 f8 [	 ]*repz xmodexp
   c:[	 ]*f3 0f a6 f8 [	 ]*repz xmodexp
#pass
