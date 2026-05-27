#objdump: -dMintel
#source: intel-movs.s
#name: x86 Intel movs (64-bit object)

.*: +file format .*

Disassembly of section .text:

0+ <movs>:
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	64 67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?fs:\[esi\]
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a4 *	movs +BYTE PTR \[edi\],(BYTE PTR )?\[esi\]
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	64 a4 *	movs +BYTE PTR \[rdi\],(BYTE PTR )?fs:\[rsi\]
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR \[rdi\],(BYTE PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	64 67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?fs:\[esi\]
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 66 a5 *	movs +WORD PTR \[edi\],(WORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	64 66 a5 *	movs +WORD PTR \[rdi\],(WORD PTR )?fs:\[rsi\]
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR \[rdi\],(WORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	64 67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?fs:\[esi\]
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 a5 *	movs +DWORD PTR \[edi\],(DWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	64 a5 *	movs +DWORD PTR \[rdi\],(DWORD PTR )?fs:\[rsi\]
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR \[rdi\],(DWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	64 48 a5 *	movs +QWORD PTR \[rdi\],(QWORD PTR )?fs:?\[rsi\]
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	48 a5 *	movs(q *| +QWORD PTR \[rdi\],(QWORD PTR )?\[rsi\])
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	64 67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?fs:?\[esi\]
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
[ 	]*[a-f0-9]+:	67 48 a5 *	movs +QWORD PTR \[edi\],(QWORD PTR )?\[esi\]
#pass
