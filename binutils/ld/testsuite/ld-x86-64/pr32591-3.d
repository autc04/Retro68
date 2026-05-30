#source: pr32591-3.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -T pr32591-3.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

00000000f0000000 <_start>:
    f0000000:	48 8b 05 f9 ff 2f 0f 	mov    0xf2ffff9\(%rip\),%rax        # ff300000 <_start\+0xf300000>
    f0000007:	48 03 1d f2 ff 2f 0f 	add    0xf2ffff2\(%rip\),%rbx        # ff300000 <_start\+0xf300000>
