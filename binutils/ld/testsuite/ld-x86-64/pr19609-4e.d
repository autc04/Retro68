#source: pr19609-4.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -Ttext=0x70000000 -Tdata=0xa0000000 --no-relax
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

0+70000000 <_start>:
[ 	]*[a-f0-9]+:	48 8d 05 f9 ff ff 2f 	lea    0x2ffffff9\(%rip\),%rax        # a0000000 <foo>
[ 	]*[a-f0-9]+:	4c 8d 1d f2 ff ff 2f 	lea    0x2ffffff2\(%rip\),%r11        # a0000000 <foo>
