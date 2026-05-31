#source: load3.s
#as: --64
#ld: -melf_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

#...
[a-f0-9]+ <_start>:
[ 	]*[a-f0-9]+:	2e 2e c7 c0 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%eax
[ 	]*[a-f0-9]+:	2e 2e 41 c7 c3 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%r11d
[ 	]*[a-f0-9]+:	2e 2e d5 10 c7 c5 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%r21d
[ 	]*[a-f0-9]+:	2e 2e 48 c7 c0 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%rax
[ 	]*[a-f0-9]+:	2e 2e 49 c7 c3 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%r11
[ 	]*[a-f0-9]+:	2e 2e d5 18 c7 c5 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%r21
[ 	]*[a-f0-9]+:	2e 2e 48 c7 c0 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%rax
[ 	]*[a-f0-9]+:	2e 2e 49 c7 c3 ([0-9a-f]{2} ){4} *	(cs ){2}mov \$0x[a-f0-9]+,%r11
#pass
