#source: load5.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

#...
[a-f0-9]+ <_start>:
[ 	]*[a-f0-9]+:	2e 68 ([0-9a-f]{2} ){4} *	cs push \$0x[a-f0-9]+
[ 	]*[a-f0-9]+:	2e 40 68 ([0-9a-f]{2} ){4} *	cs rex push \$0x[a-f0-9]+
#pass
