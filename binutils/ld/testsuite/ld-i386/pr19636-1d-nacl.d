#source: pr19636-1.s
#as: --32 -mrelax-relocations=no
#ld: -pie -m elf_i386 --no-dynamic-linker
#objdump: -dw
#target: i?86-*-nacl* x86_64-*-nacl*

.*: +file format .*


Disassembly of section .plt:

0+ <.plt>:
[ 	]*[a-f0-9]+:	ff 73 04             	pushl  0x4\(%ebx\)
[ 	]*[a-f0-9]+:	8b 4b 08             	mov    0x8\(%ebx\),%ecx
[ 	]*[a-f0-9]+:	83 e1 e0             	and    \$0xffffffe0,%ecx
[ 	]*[a-f0-9]+:	ff e1                	jmp    \*%ecx
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	8b 8b 0c 00 00 00    	mov    0xc\(%ebx\),%ecx
[ 	]*[a-f0-9]+:	83 e1 e0             	and    \$0xffffffe0,%ecx
[ 	]*[a-f0-9]+:	ff e1                	jmp    \*%ecx
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	68 00 00 00 00       	push   \$0x0
[ 	]*[a-f0-9]+:	e9 00 00 00 00       	jmp    6a <\.plt\+0x6a>
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop
[ 	]*[a-f0-9]+:	90                   	nop

Disassembly of section .text:

0+80 <_start>:
[ 	]*[a-f0-9]+:	3b 80 f8 ff ff ff    	cmp    -0x8\(%eax\),%eax
[ 	]*[a-f0-9]+:	ff a0 fc ff ff ff    	jmp    \*-0x4\(%eax\)
[ 	]*[a-f0-9]+:	e8 af ff ff ff       	call   40 <.*>
