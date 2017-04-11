#source: pr20253-1.s
#as: --64
#ld: -shared -melf_x86_64
#objdump: -dw
#notarget: x86_64-*-nacl*

.*: +file format .*


Disassembly of section .text:

0+1f8 <foo>:
 +[a-f0-9]+:	c3                   	retq   

0+1f9 <bar>:
 +[a-f0-9]+:	c3                   	retq   

0+1fa <_start>:
 +[a-f0-9]+:	ff 15 08 01 20 00    	callq  \*0x200108\(%rip\)        # 200308 <.*>
 +[a-f0-9]+:	ff 25 0a 01 20 00    	jmpq   \*0x20010a\(%rip\)        # 200310 <.*>
 +[a-f0-9]+:	48 c7 05 ff 00 20 00 00 00 00 00 	movq   \$0x0,0x2000ff\(%rip\)        # 200310 <.*>
 +[a-f0-9]+:	48 83 3d ef 00 20 00 00 	cmpq   \$0x0,0x2000ef\(%rip\)        # 200308 <.*>
 +[a-f0-9]+:	48 3b 0d e8 00 20 00 	cmp    0x2000e8\(%rip\),%rcx        # 200308 <.*>
 +[a-f0-9]+:	48 3b 0d e9 00 20 00 	cmp    0x2000e9\(%rip\),%rcx        # 200310 <.*>
#pass
