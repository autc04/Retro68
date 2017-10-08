#source: pr17154-x86.s
#as: --64
#ld: -z now -shared -melf_x86_64
#objdump: -dw
#target: x86_64-*-*
#notarget: x86_64-*-nacl*

.*: +file format .*


Disassembly of section .plt:

0+2b0 <.plt>:
 +[a-f0-9]+:	ff 35 7a 01 20 00    	pushq  0x20017a\(%rip\)        # 200430 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	ff 25 7c 01 20 00    	jmpq   \*0x20017c\(%rip\)        # 200438 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 40 00          	nopl   0x0\(%rax\)

0+2c0 <\*ABS\*\+0x30a@plt>:
 +[a-f0-9]+:	ff 25 7a 01 20 00    	jmpq   \*0x20017a\(%rip\)        # 200440 <_GLOBAL_OFFSET_TABLE_\+0x18>
 +[a-f0-9]+:	68 03 00 00 00       	pushq  \$0x3
 +[a-f0-9]+:	e9 e0 ff ff ff       	jmpq   2b0 <.plt>

0+2d0 <func1@plt>:
 +[a-f0-9]+:	ff 25 72 01 20 00    	jmpq   \*0x200172\(%rip\)        # 200448 <func1>
 +[a-f0-9]+:	68 00 00 00 00       	pushq  \$0x0
 +[a-f0-9]+:	e9 d0 ff ff ff       	jmpq   2b0 <.plt>

0+2e0 <func2@plt>:
 +[a-f0-9]+:	ff 25 6a 01 20 00    	jmpq   \*0x20016a\(%rip\)        # 200450 <func2>
 +[a-f0-9]+:	68 01 00 00 00       	pushq  \$0x1
 +[a-f0-9]+:	e9 c0 ff ff ff       	jmpq   2b0 <.plt>

0+2f0 <\*ABS\*\+0x300@plt>:
 +[a-f0-9]+:	ff 25 62 01 20 00    	jmpq   \*0x200162\(%rip\)        # 200458 <_GLOBAL_OFFSET_TABLE_\+0x30>
 +[a-f0-9]+:	68 02 00 00 00       	pushq  \$0x2
 +[a-f0-9]+:	e9 b0 ff ff ff       	jmpq   2b0 <.plt>

Disassembly of section .text:

0+300 <resolve1>:
 +[a-f0-9]+:	e8 cb ff ff ff       	callq  2d0 <func1@plt>

0+305 <g1>:
 +[a-f0-9]+:	e9 e6 ff ff ff       	jmpq   2f0 <\*ABS\*\+0x300@plt>

0+30a <resolve2>:
 +[a-f0-9]+:	e8 d1 ff ff ff       	callq  2e0 <func2@plt>

0+30f <g2>:
 +[a-f0-9]+:	e9 ac ff ff ff       	jmpq   2c0 <\*ABS\*\+0x30a@plt>
#pass
