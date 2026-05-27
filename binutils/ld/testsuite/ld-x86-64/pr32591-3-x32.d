#source: pr32591-3.s
#as: --x32 -mrelax-relocations=yes
#ld: -melf32_x86_64 -T pr32591-3.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

f0000000 <_start>:
f0000000:	40 c7 c0 08 00 30 ff 	rex mov \$0xff300008,%eax
f0000007:	48 03 1d f2 ff 2f 0f 	add    0xf2ffff2\(%rip\),%rbx        # ff300000 <_start\+0xf300000>
