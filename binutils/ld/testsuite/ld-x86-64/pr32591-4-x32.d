#source: pr32591-4.s
#as: --x32 -mrelax-relocations=yes
#ld: -melf32_x86_64 -Ttext-segment=0xf0000000 -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

f0001000 <_start>:
f0001000:	40 c7 c0 00 00 00 f0 	rex mov \$0xf0000000,%eax
f0001007:	48 03 1d f2 0f 00 00 	add    0xff2\(%rip\),%rbx        # f0002000 <_start\+0x1000>
