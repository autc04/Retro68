#source: pr32591-2.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -T pr32591-2.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

00000000ffff0000 <_start>:
    ffff0000:	48 8b 05 09 00 00 00 	mov    0x9\(%rip\),%rax        # ffff0010 <__stack_chk_guard\+0x8>
