#source: bnd-branch-1.s
#as: --64
#ld: -z now -shared -melf_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .plt:

0+290 <.plt>:
 +[a-f0-9]+:	ff 35 82 01 20 00    	pushq  0x200182\(%rip\)        # 200418 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	ff 25 84 01 20 00    	jmpq   \*0x200184\(%rip\)        # 200420 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 40 00          	nopl   0x0\(%rax\)

0+2a0 <foo2@plt>:
 +[a-f0-9]+:	ff 25 82 01 20 00    	jmpq   \*0x200182\(%rip\)        # 200428 <foo2>
 +[a-f0-9]+:	68 00 00 00 00       	pushq  \$0x0
 +[a-f0-9]+:	e9 e0 ff ff ff       	jmpq   290 <.plt>

0+2b0 <foo3@plt>:
 +[a-f0-9]+:	ff 25 7a 01 20 00    	jmpq   \*0x20017a\(%rip\)        # 200430 <foo3>
 +[a-f0-9]+:	68 01 00 00 00       	pushq  \$0x1
 +[a-f0-9]+:	e9 d0 ff ff ff       	jmpq   290 <.plt>

0+2c0 <foo1@plt>:
 +[a-f0-9]+:	ff 25 72 01 20 00    	jmpq   \*0x200172\(%rip\)        # 200438 <foo1>
 +[a-f0-9]+:	68 02 00 00 00       	pushq  \$0x2
 +[a-f0-9]+:	e9 c0 ff ff ff       	jmpq   290 <.plt>

0+2d0 <foo4@plt>:
 +[a-f0-9]+:	ff 25 6a 01 20 00    	jmpq   \*0x20016a\(%rip\)        # 200440 <foo4>
 +[a-f0-9]+:	68 03 00 00 00       	pushq  \$0x3
 +[a-f0-9]+:	e9 b0 ff ff ff       	jmpq   290 <.plt>

Disassembly of section .text:

0+2e0 <_start>:
 +[a-f0-9]+:	f2 e9 da ff ff ff    	bnd jmpq 2c0 <foo1@plt>
 +[a-f0-9]+:	e8 b5 ff ff ff       	callq  2a0 <foo2@plt>
 +[a-f0-9]+:	e9 c0 ff ff ff       	jmpq   2b0 <foo3@plt>
 +[a-f0-9]+:	e8 db ff ff ff       	callq  2d0 <foo4@plt>
 +[a-f0-9]+:	f2 e8 b5 ff ff ff    	bnd callq 2b0 <foo3@plt>
 +[a-f0-9]+:	e9 d0 ff ff ff       	jmpq   2d0 <foo4@plt>
#pass
