#source: pr20253-1.s
#as: --x32
#ld: -shared -melf32_x86_64
#objdump: -dw
#notarget: x86_64-*-nacl*

.*: +file format .*


Disassembly of section .text:

0+158 <foo>:
 +[a-f0-9]+:	c3                   	retq   

0+159 <bar>:
 +[a-f0-9]+:	c3                   	retq   

0+15a <_start>:
 +[a-f0-9]+:	ff 15 98 00 20 00    	callq  \*0x200098\(%rip\)        # 2001f8 <.*>
 +[a-f0-9]+:	ff 25 9a 00 20 00    	jmpq   \*0x20009a\(%rip\)        # 200200 <.*>
 +[a-f0-9]+:	48 c7 05 8f 00 20 00 00 00 00 00 	movq   \$0x0,0x20008f\(%rip\)        # 200200 <.*>
 +[a-f0-9]+:	48 83 3d 7f 00 20 00 00 	cmpq   \$0x0,0x20007f\(%rip\)        # 2001f8 <.*>
 +[a-f0-9]+:	48 3b 0d 78 00 20 00 	cmp    0x200078\(%rip\),%rcx        # 2001f8 <.*>
 +[a-f0-9]+:	48 3b 0d 79 00 20 00 	cmp    0x200079\(%rip\),%rcx        # 200200 <.*>
#pass
