#as:
#objdump: -drw
#name: Check tls relocation 32 bit-mode

.*: +file format .*


Disassembly of section .text:

00000000 <_start>:
\s*[a-f0-9]+:\s*8d 04 1d 00 00 00 00[	 ]+lea    0x0\(,%ebx,1\),%eax	3: R_386_TLS_GD	foo
\s*[a-f0-9]+:\s*8d 81 00 00 00 00[	 ]+lea    0x0\(%ecx\),%eax	9: R_386_TLS_GD	foo
\s*[a-f0-9]+:\s*8d 83 00 00 00 00[	 ]+lea    0x0\(%ebx\),%eax	f: R_386_TLS_LDM	foo
\s*[a-f0-9]+:\s*8d 83 00 00 00 00[	 ]+lea    0x0\(%ebx\),%eax	15: R_386_TLS_GOTDESC	x
\s*[a-f0-9]+:\s*a1 00 00 00 00[	 ]+mov    0x0,%eax	1a: R_386_TLS_IE	foo
\s*[a-f0-9]+:\s*8b 1d 00 00 00 00[	 ]+mov    0x0,%ebx	20: R_386_TLS_IE	foo
\s*[a-f0-9]+:\s*03 15 00 00 00 00[	 ]+add    0x0,%edx	26: R_386_TLS_IE	foo
\s*[a-f0-9]+:\s*2b 8b 00 00 00 00[	 ]+sub    0x0\(%ebx\),%ecx	2c: R_386_TLS_GOTIE	foo
\s*[a-f0-9]+:\s*8b 8b 00 00 00 00[	 ]+mov    0x0\(%ebx\),%ecx	32: R_386_TLS_GOTIE	foo
\s*[a-f0-9]+:\s*03 8b 00 00 00 00[	 ]+add    0x0\(%ebx\),%ecx	38: R_386_TLS_GOTIE	foo
\s*[a-f0-9]+:\s*2b 8b 00 00 00 00[	 ]+sub    0x0\(%ebx\),%ecx	3e: R_386_TLS_IE_32	foo
\s*[a-f0-9]+:\s*8b 8b 00 00 00 00[	 ]+mov    0x0\(%ebx\),%ecx	44: R_386_TLS_IE_32	foo
\s*[a-f0-9]+:\s*03 8b 00 00 00 00[	 ]+add    0x0\(%ebx\),%ecx	4a: R_386_TLS_IE_32	foo
\s*[a-f0-9]+:\s*ff 10[	 ]+call   \*\(%eax\)	4e: R_386_TLS_DESC_CALL	foo
#pass
