#objdump: -dw
#name: Zhaoxin PadLock PHE2

.*: +file format .*

Disassembly of section .text:

0+000 <foo>:
   0:[	 ]*f3 0f a6 d8 [	 ]*repz xsha384
   4:[	 ]*f3 0f a6 d8 [	 ]*repz xsha384
   8:[	 ]*f3 0f a6 e0 [	 ]*repz xsha512
   c:[	 ]*f3 0f a6 e0 [	 ]*repz xsha512
#pass
