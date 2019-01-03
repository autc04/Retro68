#source: pie3.s
#as: --64
#ld: -pie -melf_x86_64 --hash-style=sysv
#objdump: -dw
#target: x86_64-*-nacl*

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +0:	48 8d 05 f9 ff ff ff 	lea    -0x7\(%rip\),%rax        # 0 <_start>
#pass
