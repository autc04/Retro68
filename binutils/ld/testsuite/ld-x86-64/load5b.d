#source: load5.s
#as: --64 -mrelax-relocations=yes
#ld: -shared -melf_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

#...
[a-f0-9]+ <_start>:
[ 	]*[a-f0-9]+:	ff 35 ([0-9a-f]{2} ){4} *	push +0x[a-f0-9]+\(%rip\)        # [a-f0-9]+ <.*>
[ 	]*[a-f0-9]+:	40 ff 35 ([0-9a-f]{2} ){4} *	rex push 0x[a-f0-9]+\(%rip\)        # [a-f0-9]+ <.*>
#pass
