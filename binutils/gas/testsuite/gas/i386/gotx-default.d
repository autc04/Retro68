#source: gotx.s
#objdump: -dwr
#skip: *-*-solaris*

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
[ 	]*[a-f0-9]+:	ff a3 00 00 00 00    	jmp    \*0x0\(%ebx\)	2: R_386_GOT32X	_start
