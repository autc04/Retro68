#source: load9.s
#as: --32 -mshared -mrelax-relocations=yes --defsym PIC=1
#ld: -melf_i386 -shared -z noseparate-code
#objdump: -dw

.*: +file format .*

Disassembly of section .text:

0+[0-9a-f]+ <_start>:
[ 	]*[0-9a-f]+:	ff b1 f8 ff ff ff    	push   -0x8\(%ecx\)
[ 	]*[0-9a-f]+:	ff b2 fc ff ff ff    	push   -0x4\(%edx\)
#pass
