#source: ibt-plt-3.s
#as: --32
#ld: -shared -m elf_i386 -z ibtplt
#objdump: -dw

.*: +file format .*


Disassembly of section .plt:

0+190 <.plt>:
 +[a-f0-9]+:	ff b3 04 00 00 00    	pushl  0x4\(%ebx\)
 +[a-f0-9]+:	ff a3 08 00 00 00    	jmp    \*0x8\(%ebx\)
 +[a-f0-9]+:	0f 1f 40 00          	nopl   0x0\(%eax\)
 +[a-f0-9]+:	f3 0f 1e fb          	endbr32 
 +[a-f0-9]+:	68 00 00 00 00       	push   \$0x0
 +[a-f0-9]+:	e9 e2 ff ff ff       	jmp    190 <.plt>
 +[a-f0-9]+:	66 90                	xchg   %ax,%ax
 +[a-f0-9]+:	f3 0f 1e fb          	endbr32 
 +[a-f0-9]+:	68 08 00 00 00       	push   \$0x8
 +[a-f0-9]+:	e9 d2 ff ff ff       	jmp    190 <.plt>
 +[a-f0-9]+:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.sec:

0+1c0 <bar1@plt>:
 +[a-f0-9]+:	f3 0f 1e fb          	endbr32 
 +[a-f0-9]+:	ff a3 0c 00 00 00    	jmp    \*0xc\(%ebx\)
 +[a-f0-9]+:	66 0f 1f 44 00 00    	nopw   0x0\(%eax,%eax,1\)

0+1d0 <bar2@plt>:
 +[a-f0-9]+:	f3 0f 1e fb          	endbr32 
 +[a-f0-9]+:	ff a3 10 00 00 00    	jmp    \*0x10\(%ebx\)
 +[a-f0-9]+:	66 0f 1f 44 00 00    	nopw   0x0\(%eax,%eax,1\)

Disassembly of section .text:

0+1e0 <foo>:
 +[a-f0-9]+:	53                   	push   %ebx
 +[a-f0-9]+:	e8 18 00 00 00       	call   1fe <__x86.get_pc_thunk.bx>
 +[a-f0-9]+:	81 c3 06 11 00 00    	add    \$0x1106,%ebx
 +[a-f0-9]+:	83 ec 08             	sub    \$0x8,%esp
 +[a-f0-9]+:	e8 dc ff ff ff       	call   1d0 <bar2@plt>
 +[a-f0-9]+:	e8 c7 ff ff ff       	call   1c0 <bar1@plt>
 +[a-f0-9]+:	83 c4 08             	add    \$0x8,%esp
 +[a-f0-9]+:	5b                   	pop    %ebx
 +[a-f0-9]+:	c3                   	ret    

0+1fe <__x86.get_pc_thunk.bx>:
 +[a-f0-9]+:	8b 1c 24             	mov    \(%esp\),%ebx
 +[a-f0-9]+:	c3                   	ret    
#pass
