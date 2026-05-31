#as: -mrelax-relocations=yes
#objdump: -dwr

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	ff 15 00 00 00 00    	call   \*0x0\(%rip\)        # 6 <_start\+0x6>	2: R_X86_64_GOTPCRELX	acos-0x4
#pass
