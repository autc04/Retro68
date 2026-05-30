#as:
#as: -f
#objdump: -dw
#name: i386 line comment

.*: +file format .*

Disassembly of section .text:

0+ <line_comment>:
 +[a-f0-9]+:	90[ 	]+nop
 +[a-f0-9]+:	c3[ 	]+ret
#pass
