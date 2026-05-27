#source: pr32591-4.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -Ttext-segment=0xf0000000 -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

00000000f0001000 <_start>:
    f0001000:	48 8b 05 f9 0f 00 00 	mov    0xff9\(%rip\),%rax        # f0002000 <_start\+0x1000>
    f0001007:	48 03 1d f2 0f 00 00 	add    0xff2\(%rip\),%rbx        # f0002000 <_start\+0x1000>
