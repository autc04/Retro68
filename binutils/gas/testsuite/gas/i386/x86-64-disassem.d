#objdump: -drw
#name: x86-64 opcodes with invalid modrm byte

.*: +file format .*


Disassembly of section \.text:

0+ <\.text>:
[ 	]*[a-f0-9]+:[ 	]*ff[ 	]*\(bad\)  
[ 	]*[a-f0-9]+:[ 	]*ef[ 	]*out    %eax,\(%dx\)
[ 	]*[a-f0-9]+:[ 	]*ff[ 	]*\(bad\)  
[ 	]*[a-f0-9]+:[ 	]*d8[ 	]*\.byte 0xd8
#pass
