#objdump: -dw
#name: x86-64 rep prefix

.*: +file format .*

Disassembly of section .text:

0+ <_start>:
   0:	f3 6c[ 	]+rep insb \(%dx\),\(%rdi\)
   2:	f3 6e[ 	]+rep outsb \(%rsi\),\(%dx\)
   4:	f3 a4[ 	]+rep movsb \(%rsi\),\(%rdi\)
   6:	f3 ac[ 	]+rep lods \(%rsi\),%al
   8:	f3 aa[ 	]+rep stos %al,\(%rdi\)
   a:	f3 a6[ 	]+repz cmpsb \(%rdi\),\(%rsi\)
   c:	f3 ae[ 	]+repz scas \(%rdi\),%al
   e:	66 f3 6d[ 	]+rep insw \(%dx\),\(%rdi\)
  11:	66 f3 6f[ 	]+rep outsw \(%rsi\),\(%dx\)
  14:	66 f3 a5[ 	]+rep movsw \(%rsi\),\(%rdi\)
  17:	66 f3 ad[ 	]+rep lods \(%rsi\),%ax
  1a:	66 f3 ab[ 	]+rep stos %ax,\(%rdi\)
  1d:	66 f3 a7[ 	]+repz cmpsw \(%rdi\),\(%rsi\)
  20:	66 f3 af[ 	]+repz scas \(%rdi\),%ax
  23:	f3 6d[ 	]+rep insl \(%dx\),\(%rdi\)
  25:	f3 6f[ 	]+rep outsl \(%rsi\),\(%dx\)
  27:	f3 a5[ 	]+rep movsl \(%rsi\),\(%rdi\)
  29:	f3 ad[ 	]+rep lods \(%rsi\),%eax
  2b:	f3 ab[ 	]+rep stos %eax,\(%rdi\)
  2d:	f3 a7[ 	]+repz cmpsl \(%rdi\),\(%rsi\)
  2f:	f3 af[ 	]+repz scas \(%rdi\),%eax
  31:	f3 48 a5[ 	]+rep movsq \(%rsi\),\(%rdi\)
  34:	f3 48 ad[ 	]+rep lods \(%rsi\),%rax
  37:	f3 48 ab[ 	]+rep stos %rax,\(%rdi\)
  3a:	f3 48 a7[ 	]+repz cmpsq \(%rdi\),\(%rsi\)
  3d:	f3 48 af[ 	]+repz scas \(%rdi\),%rax
  40:	67 f3 6c[ 	]+rep insb \(%dx\),\(%edi\)
  43:	67 f3 6e[ 	]+rep outsb \(%esi\),\(%dx\)
  46:	67 f3 a4[ 	]+rep movsb \(%esi\),\(%edi\)
  49:	67 f3 ac[ 	]+rep lods \(%esi\),%al
  4c:	67 f3 aa[ 	]+rep stos %al,\(%edi\)
  4f:	67 f3 a6[ 	]+repz cmpsb \(%edi\),\(%esi\)
  52:	67 f3 ae[ 	]+repz scas \(%edi\),%al
  55:	67 66 f3 6d[ 	]+rep insw \(%dx\),\(%edi\)
  59:	67 66 f3 6f[ 	]+rep outsw \(%esi\),\(%dx\)
  5d:	67 66 f3 a5[ 	]+rep movsw \(%esi\),\(%edi\)
  61:	67 66 f3 ad[ 	]+rep lods \(%esi\),%ax
  65:	67 66 f3 ab[ 	]+rep stos %ax,\(%edi\)
  69:	67 66 f3 a7[ 	]+repz cmpsw \(%edi\),\(%esi\)
  6d:	67 66 f3 af[ 	]+repz scas \(%edi\),%ax
  71:	67 f3 6d[ 	]+rep insl \(%dx\),\(%edi\)
  74:	67 f3 6f[ 	]+rep outsl \(%esi\),\(%dx\)
  77:	67 f3 a5[ 	]+rep movsl \(%esi\),\(%edi\)
  7a:	67 f3 ad[ 	]+rep lods \(%esi\),%eax
  7d:	67 f3 ab[ 	]+rep stos %eax,\(%edi\)
  80:	67 f3 a7[ 	]+repz cmpsl \(%edi\),\(%esi\)
  83:	67 f3 af[ 	]+repz scas \(%edi\),%eax
  86:	67 f3 48 a5[ 	]+rep movsq \(%esi\),\(%edi\)
  8a:	67 f3 48 ad[ 	]+rep lods \(%esi\),%rax
  8e:	67 f3 48 ab[ 	]+rep stos %rax,\(%edi\)
  92:	67 f3 48 a7[ 	]+repz cmpsq \(%edi\),\(%esi\)
  96:	67 f3 48 af[ 	]+repz scas \(%edi\),%rax
#pass
