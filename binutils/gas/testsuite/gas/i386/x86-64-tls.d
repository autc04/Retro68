#as:
#objdump: -drw
#name: Check tls relocation x86-64

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	48 8d 3d 00 00 00 00 	lea    0x0\(%rip\),%rdi        # 7 <_start\+0x7>	3: R_X86_64_TLSGD	foo-0x4
 +[a-f0-9]+:	48 8d 3d 00 00 00 00 	lea    0x0\(%rip\),%rdi        # e <_start\+0xe>	a: R_X86_64_TLSLD	foo-0x4
 +[a-f0-9]+:	48 8d 05 00 00 00 00 	lea    0x0\(%rip\),%rax        # 15 <_start\+0x15>	11: R_X86_64_GOTPC32_TLSDESC	x-0x4
 +[a-f0-9]+:	4c 03 25 00 00 00 00 	add    0x0\(%rip\),%r12        # 1c <_start\+0x1c>	18: R_X86_64_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	48 8b 05 00 00 00 00 	mov    0x0\(%rip\),%rax        # 23 <_start\+0x23>	1f: R_X86_64_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	d5 48 03 05 00 00 00 00 	add    0x0\(%rip\),%r16        # 2b <_start\+0x2b>	27: R_X86_64_CODE_4_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	d5 48 8b 25 00 00 00 00 	mov    0x0\(%rip\),%r20        # 33 <_start\+0x33>	2f: R_X86_64_CODE_4_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	62 64 bc 18 01 35 00 00 00 00 	add    %r30,0x0\(%rip\),%r8        # 3d <_start\+0x3d>	39: R_X86_64_CODE_6_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	62 f4 dc 10 03 05 00 00 00 00 	add    0x0\(%rip\),%rax,%r20        # 47 <_start\+0x47>	43: R_X86_64_CODE_6_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	62 e4 fc 0c 03 05 00 00 00 00 	\{nf\} add 0x0\(%rip\),%r16        # 51 <_start\+0x51>	4d: R_X86_64_CODE_6_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	62 64 bc 1c 01 35 00 00 00 00 	\{nf\} add %r30,0x0\(%rip\),%r8        # 5b <_start\+0x5b>	57: R_X86_64_CODE_6_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	62 f4 dc 14 03 05 00 00 00 00 	\{nf\} add 0x0\(%rip\),%rax,%r20        # 65 <_start\+0x65>	61: R_X86_64_CODE_6_GOTTPOFF	foo-0x4
 +[a-f0-9]+:	ff 10                	call   \*\(%rax\)	65: R_X86_64_TLSDESC_CALL	x
 +[a-f0-9]+:	67 ff 10             	call   \*\(%eax\)	67: R_X86_64_TLSDESC_CALL	x
#pass
