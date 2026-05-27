#as:
#as: -f
#objdump: -dw --disassemble-zeroes
#name: generic line comment

.*: +file format .*

Disassembly of section .text:

0+ <(line_comment|\.text)>:
 +0+:	.*
#pass
