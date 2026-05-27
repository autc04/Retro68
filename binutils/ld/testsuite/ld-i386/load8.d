#as: --32 -mrelax-relocations=yes
#ld: -melf_i386 -z noseparate-code
#objdump: -dw

.*: +file format .*

Disassembly of section .text:

0+8048074 <_start>:
[ 	]*[a-f0-9]+:	12 05 90 90 04 08    	adc    0x8049090,%al
[ 	]*[a-f0-9]+:	6b 05 90 90 04 08 01 	imul   \$(0x)?1,0x8049090,%eax
[ 	]*[a-f0-9]+:	84 35 90 90 04 08    	test   %dh,0x8049090
[ 	]*[a-f0-9]+:	87 05 90 90 04 08    	xchg   %eax,0x8049090
#pass
