#source: load9.s
#as: --32 -mrelax-relocations=yes
#ld: -melf_i386 -z noseparate-code
#objdump: -dw

.*: +file format .*

Disassembly of section .text:

0+8048074 <_start>:
[ 	]*[a-f0-9]+:	2e 68 86 90 04 08    	cs push \$0x8049086
[ 	]*[a-f0-9]+:	2e 68 87 90 04 08    	cs push \$0x8049087
[ 	]*[a-f0-9]+:	2e 68 87 90 04 08    	cs push \$0x8049087
#pass
