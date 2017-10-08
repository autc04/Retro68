#as: --64 -madd-bnd-prefix
#ld: -shared -melf_x86_64 -z bndplt
#objdump: -dw

#...
0+2b0 <.plt>:
[ 	]*[a-f0-9]+:	ff 35 7a 01 20 00    	pushq  0x20017a\(%rip\)        # 200430 <_GLOBAL_OFFSET_TABLE_\+0x8>
[ 	]*[a-f0-9]+:	f2 ff 25 7b 01 20 00 	bnd jmpq \*0x20017b\(%rip\)        # 200438 <_GLOBAL_OFFSET_TABLE_\+0x10>
[ 	]*[a-f0-9]+:	0f 1f 00             	nopl   \(%rax\)
[ 	]*[a-f0-9]+:	68 03 00 00 00       	pushq  \$0x3
[ 	]*[a-f0-9]+:	f2 e9 e5 ff ff ff    	bnd jmpq 2b0 <.*>
[ 	]*[a-f0-9]+:	0f 1f 44 00 00       	nopl   0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	68 00 00 00 00       	pushq  \$0x0
[ 	]*[a-f0-9]+:	f2 e9 d5 ff ff ff    	bnd jmpq 2b0 <.*>
[ 	]*[a-f0-9]+:	0f 1f 44 00 00       	nopl   0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	68 01 00 00 00       	pushq  \$0x1
[ 	]*[a-f0-9]+:	f2 e9 c5 ff ff ff    	bnd jmpq 2b0 <.*>
[ 	]*[a-f0-9]+:	0f 1f 44 00 00       	nopl   0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	68 02 00 00 00       	pushq  \$0x2
[ 	]*[a-f0-9]+:	f2 e9 b5 ff ff ff    	bnd jmpq 2b0 <.*>
[ 	]*[a-f0-9]+:	0f 1f 44 00 00       	nopl   0x0\(%rax,%rax,1\)

Disassembly of section .plt.sec:

0+300 <\*ABS\*\+0x32c@plt>:
[ 	]*[a-f0-9]+:	f2 ff 25 39 01 20 00 	bnd jmpq \*0x200139\(%rip\)        # 200440 <_GLOBAL_OFFSET_TABLE_\+0x18>
[ 	]*[a-f0-9]+:	90                   	nop

0+308 <func1@plt>:
[ 	]*[a-f0-9]+:	f2 ff 25 39 01 20 00 	bnd jmpq \*0x200139\(%rip\)        # 200448 <func1>
[ 	]*[a-f0-9]+:	90                   	nop

0+310 <func2@plt>:
[ 	]*[a-f0-9]+:	f2 ff 25 39 01 20 00 	bnd jmpq \*0x200139\(%rip\)        # 200450 <func2>
[ 	]*[a-f0-9]+:	90                   	nop

0+318 <\*ABS\*\+0x320@plt>:
[ 	]*[a-f0-9]+:	f2 ff 25 39 01 20 00 	bnd jmpq \*0x200139\(%rip\)        # 200458 <_GLOBAL_OFFSET_TABLE_\+0x30>
[ 	]*[a-f0-9]+:	90                   	nop

Disassembly of section .text:

0+320 <resolve1>:
[ 	]*[a-f0-9]+:	f2 e8 e2 ff ff ff    	bnd callq 308 <func1@plt>

0+326 <g1>:
[ 	]*[a-f0-9]+:	f2 e9 ec ff ff ff    	bnd jmpq 318 <\*ABS\*\+0x320@plt>

0+32c <resolve2>:
[ 	]*[a-f0-9]+:	f2 e8 de ff ff ff    	bnd callq 310 <func2@plt>

0+332 <g2>:
[ 	]*[a-f0-9]+:	f2 e9 c8 ff ff ff    	bnd jmpq 300 <\*ABS\*\+0x32c@plt>
#pass
