#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -z max-page-size=0x200000 -z noseparate-code
#objdump: -dw

.*: +file format .*

Disassembly of section .text:

0+4000b0 <_start>:
[ 	]*[a-f0-9]+:	12 05 ([0-9a-f]{2} ){4} *	adc    0x[a-f0-9]+\(%rip\),%al        # 6000e0 <.*>
[ 	]*[a-f0-9]+:	44 84 3d ([0-9a-f]{2} ){4} *	test   %r15b,0x[a-f0-9]+\(%rip\)        # 6000e0 <.*>
[ 	]*[a-f0-9]+:	48 87 05 ([0-9a-f]{2} ){4} *	xchg   %rax,0x[a-f0-9]+\(%rip\)        # 6000e0 <.*>
[ 	]*[a-f0-9]+:	d5 c0 03 05 ([0-9a-f]{2} ){4} *	lsl    0x[a-f0-9]+\(%rip\),%r16d        # 6000e0 <.*>
[ 	]*[a-f0-9]+:	d5 80 13 05 ([0-9a-f]{2} ){4} *	\{rex2 0x80\} movlps %xmm0,0x[a-f0-9]+\(%rip\)        # 6000e0 <.*>
[ 	]*[a-f0-9]+:	d5 80 2b 05 ([0-9a-f]{2} ){4} *	\{rex2 0x80\} movntps %xmm0,0x[a-f0-9]+\(%rip\)        # 6000e0 <.*>
#pass
