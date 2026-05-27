#source: pr32591-2.s
#as: --x32 -mrelax-relocations=yes
#ld: -melf32_x86_64 -T pr32591-2.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

ffff0000 <_start>:
ffff0000:	40 c7 c0 08 00 ff ff 	rex mov \$0xffff0008,%eax
