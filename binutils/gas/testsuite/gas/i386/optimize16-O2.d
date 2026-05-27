#name: 16-bit optimized encoding with -O2
#source: optimize16.s
#as: -O2
#objdump: -drwMi8086

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	66 0f b7 c3          	movzwl %bx,%eax
 +[a-f0-9]+:	66 0f b7 ce          	movzwl %si,%ecx
 +[a-f0-9]+:	66 0f b7 d7          	movzwl %di,%edx
#pass
