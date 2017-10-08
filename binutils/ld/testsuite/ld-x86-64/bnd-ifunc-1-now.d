#source: bnd-ifunc-1.s
#as: --64 -madd-bnd-prefix
#ld: -z now -shared -melf_x86_64 -z bndplt
#objdump: -dw

.*: +file format .*


Disassembly of section .plt:

0+1f0 <.plt>:
 +[a-f0-9]+:	ff 35 4a 01 20 00    	pushq  0x20014a\(%rip\)        # 200340 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	f2 ff 25 4b 01 20 00 	bnd jmpq \*0x20014b\(%rip\)        # 200348 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 00             	nopl   \(%rax\)
 +[a-f0-9]+:	68 00 00 00 00       	pushq  \$0x0
 +[a-f0-9]+:	f2 e9 e5 ff ff ff    	bnd jmpq 1f0 <.plt>
 +[a-f0-9]+:	0f 1f 44 00 00       	nopl   0x0\(%rax,%rax,1\)

Disassembly of section .plt.sec:

0+210 <\*ABS\*\+0x218@plt>:
 +[a-f0-9]+:	f2 ff 25 39 01 20 00 	bnd jmpq \*0x200139\(%rip\)        # 200350 <_GLOBAL_OFFSET_TABLE_\+0x18>
 +[a-f0-9]+:	90                   	nop

Disassembly of section .text:

0+218 <foo>:
 +[a-f0-9]+:	f2 c3                	bnd retq 

0+21a <bar>:
 +[a-f0-9]+:	f2 e8 f0 ff ff ff    	bnd callq 210 <\*ABS\*\+0x218@plt>
 +[a-f0-9]+:	f2 c3                	bnd retq 
#pass
