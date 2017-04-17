#source: pr19636-2.s
#as: --64 -mrelax-relocations=no
#ld: -pie -m elf_x86_64 --no-dynamic-linker
#objdump: -dw
#target: x86_64-*-nacl*

.*: +file format .*


Disassembly of section .plt:

0+ <.plt>:
[ 	]*[a-f0-9]+:	ff 35 42 02 01 10    	pushq  0x10010242\(%rip\)        # 10010248 <_GLOBAL_OFFSET_TABLE_\+0x8>
[ 	]*[a-f0-9]+:	4c 8b 1d 43 02 01 10 	mov    0x10010243\(%rip\),%r11        # 10010250 <_GLOBAL_OFFSET_TABLE_\+0x10>
[ 	]*[a-f0-9]+:	41 83 e3 e0          	and    \$0xffffffe0,%r11d
[ 	]*[a-f0-9]+:	4d 01 fb             	add    %r15,%r11
[ 	]*[a-f0-9]+:	41 ff e3             	jmpq   \*%r11
[ 	]*[a-f0-9]+:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 nopw %cs:0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 nopw %cs:0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	66 90                	xchg   %ax,%ax
[ 	]*[a-f0-9]+:	4c 8b 1d 11 02 01 10 	mov    0x10010211\(%rip\),%r11        # 10010258 <_GLOBAL_OFFSET_TABLE_\+0x18>
[ 	]*[a-f0-9]+:	41 83 e3 e0          	and    \$0xffffffe0,%r11d
[ 	]*[a-f0-9]+:	4d 01 fb             	add    %r15,%r11
[ 	]*[a-f0-9]+:	41 ff e3             	jmpq   \*%r11
[ 	]*[a-f0-9]+:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 nopw %cs:0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	68 00 00 00 00       	pushq  \$0x0
[ 	]*[a-f0-9]+:	e9 00 00 00 00       	jmpq   6a <\.plt\+0x6a>
[ 	]*[a-f0-9]+:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 nopw %cs:0x0\(%rax,%rax,1\)
[ 	]*[a-f0-9]+:	0f 1f 80 00 00 00 00 	nopl   0x0\(%rax\)

Disassembly of section .text:

0+80 <_start>:
[ 	]*[a-f0-9]+:	48 3b 05 a9 01 01 10 	cmp    0x100101a9\(%rip\),%rax        # 10010230 <\.got>
[ 	]*[a-f0-9]+:	ff 25 ab 01 01 10    	jmpq   \*0x100101ab\(%rip\)        # 10010238 <\.got\+0x8>
[ 	]*[a-f0-9]+:	e8 ae ff ff ff       	callq  40 <\.plt\+0x40>
