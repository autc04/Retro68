#objdump: -dw
#name: Zhaoxin PadLock RNG2

.*: +file format .*

Disassembly of section .text:

0+000 <foo>:
   0:[	 ]*f3 0f a7 f8 [	 ]*repz xrng2
   4:[	 ]*f3 0f a7 f8 [	 ]*repz xrng2
#pass
