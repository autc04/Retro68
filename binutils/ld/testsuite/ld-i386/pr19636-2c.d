#source: pr19636-2.s
#as: --32 -mrelax-relocations=no
#ld: -pie -m elf_i386
#objdump: -dw
#notarget: i?86-*-nacl* x86_64-*-nacl*

.*: +file format .*


Disassembly of section .plt:

0+130 <.plt>:
[ 	]*[a-f0-9]+:	ff b3 04 00 00 00    	pushl  0x4\(%ebx\)
[ 	]*[a-f0-9]+:	ff a3 08 00 00 00    	jmp    \*0x8\(%ebx\)
[ 	]*[a-f0-9]+:	00 00                	add    %al,\(%eax\)
[ 	]*[a-f0-9]+:	00 00                	add    %al,\(%eax\)
[ 	]*[a-f0-9]+:	ff a3 0c 00 00 00    	jmp    \*0xc\(%ebx\)
[ 	]*[a-f0-9]+:	68 00 00 00 00       	push   \$0x0
[ 	]*[a-f0-9]+:	e9 00 00 00 00       	jmp    150 <_start>

Disassembly of section .text:

0+150 <_start>:
[ 	]*[a-f0-9]+:	3b 80 fc ff ff ff    	cmp    -0x4\(%eax\),%eax
[ 	]*[a-f0-9]+:	ff a0 fc ff ff ff    	jmp    \*-0x4\(%eax\)
[ 	]*[a-f0-9]+:	e8 df ff ff ff       	call   140 <.*>
[ 	]*[a-f0-9]+:	3d 00 00 00 00       	cmp    \$0x0,%eax
[ 	]*[a-f0-9]+:	e8 fc ff ff ff       	call   167 <.*>
