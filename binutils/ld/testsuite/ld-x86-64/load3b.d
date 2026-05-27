#source: load3.s
#as: --64
#ld: -shared -melf_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

#...
[a-f0-9]+ <_start>:
[ 	]*[a-f0-9]+:	2e 2e 8d 05 ([0-9a-f]{2} ){4} *	(cs ){2}lea -0x[a-f0-9]+\(%rip\),%eax        # [a-f0-9]+ <foo>
[ 	]*[a-f0-9]+:	2e 2e 44 8d 1d ([0-9a-f]{2} ){4} *	(cs ){2}lea 0x[a-f0-9]+\(%rip\),%r11d        # [a-f0-9]+ <bar>
[ 	]*[a-f0-9]+:	2e 2e d5 40 8d 2d ([0-9a-f]{2} ){4} *	(cs ){2}lea 0x[a-f0-9]+\(%rip\),%r21d        # [a-f0-9]+ <bar>
[ 	]*[a-f0-9]+:	2e 2e 48 8d 05 ([0-9a-f]{2} ){4} *	(cs ){2}lea -0x[a-f0-9]+\(%rip\),%rax        # [a-f0-9]+ <foo>
[ 	]*[a-f0-9]+:	2e 2e 4c 8d 1d ([0-9a-f]{2} ){4} *	(cs ){2}lea 0x[a-f0-9]+\(%rip\),%r11        # [a-f0-9]+ <bar>
[ 	]*[a-f0-9]+:	2e 2e d5 48 8d 2d ([0-9a-f]{2} ){4} *	(cs ){2}lea 0x[a-f0-9]+\(%rip\),%r21        # [a-f0-9]+ <bar>
[ 	]*[a-f0-9]+:	2e 2e 48 8d 05 ([0-9a-f]{2} ){4} *	(cs ){2}lea 0x[a-f0-9]+\(%rip\),%rax        # [a-f0-9]+ <__start_my_section>
[ 	]*[a-f0-9]+:	2e 2e 4c 8d 1d ([0-9a-f]{2} ){4} *	(cs ){2}lea 0x[a-f0-9]+\(%rip\),%r11        # [a-f0-9]+ <(__stop_my_section|pad)>
#pass
