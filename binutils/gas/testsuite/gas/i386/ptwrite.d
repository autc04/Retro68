#as:
#objdump: -dw
#name: i386 PTWRITE insns
#source: ptwrite.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
 +[a-f0-9]+:	f3 0f ae e1          	ptwrite %ecx
 +[a-f0-9]+:	f3 0f ae e1          	ptwrite %ecx
 +[a-f0-9]+:	f3 0f ae 21          	ptwritel \(%ecx\)
 +[a-f0-9]+:	f3 0f ae 21          	ptwritel \(%ecx\)
 +[a-f0-9]+:	f3 0f ae e1          	ptwrite %ecx
 +[a-f0-9]+:	f3 0f ae 21          	ptwritel \(%ecx\)
#pass
