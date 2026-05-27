#name: 16-bit optimized encoding with -Os
#source: optimize16.s
#as: -Os
#objdump: -drwMi8086

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	66 8d 07             	lea    \(%bx\),%eax
 +[a-f0-9]+:	66 8d 0c             	lea    \(%si\),%ecx
 +[a-f0-9]+:	66 8d 15             	lea    \(%di\),%edx
#pass
