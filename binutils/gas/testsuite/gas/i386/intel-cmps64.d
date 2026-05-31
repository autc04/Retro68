#objdump: -dMintel
#source: intel-cmps.s
#name: x86 Intel cmps (64-bit object)

.*: +file format .*

Disassembly of section .text:

0+ <cmps>:
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	64 67 a6 *	cmps +BYTE PTR fs:\[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a6 *	cmps +BYTE PTR \[esi\],(BYTE PTR )?\[edi\]
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	64 a6 *	cmps +BYTE PTR fs:\[rsi\],(BYTE PTR )?\[rdi\]
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a6 *	cmps(b *| +BYTE PTR \[rsi\],(BYTE PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	64 67 66 a7 *	cmps +WORD PTR fs:\[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 66 a7 *	cmps +WORD PTR \[esi\],(WORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	64 66 a7 *	cmps +WORD PTR fs:\[rsi\],(WORD PTR )?\[rdi\]
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	66 a7 *	cmps(w *| +WORD PTR \[rsi\],(WORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	64 67 a7 *	cmps +DWORD PTR fs:\[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 a7 *	cmps +DWORD PTR \[esi\],(DWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	64 a7 *	cmps +DWORD PTR fs:\[rsi\],(DWORD PTR )?\[rdi\]
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	a7 *	cmps(d *| +DWORD PTR \[rsi\],(DWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	64 48 a7 *	cmps +QWORD PTR fs:?\[rsi\],(QWORD PTR )?\[rdi\]
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	48 a7 *	cmps(q *| +QWORD PTR \[rsi\],(QWORD PTR )?\[rdi\])
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	64 67 48 a7 *	cmps +QWORD PTR fs:?\[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
[ 	]*[a-f0-9]+:	67 48 a7 *	cmps +QWORD PTR \[esi\],(QWORD PTR )?\[edi\]
#pass
