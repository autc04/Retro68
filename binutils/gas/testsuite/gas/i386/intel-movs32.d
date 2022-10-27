#objdump: -dMintel
#source: intel-movs.s
#name: x86 Intel movs (32-bit object)

.*: +file format .*

Disassembly of section .text:

0+ <movs>:
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR es:\[edi\],(BYTE PTR )?(ds:)?\[esi\])
[ 	]*[a-f0-9]+:	a4 *	movs(b *| +BYTE PTR es:\[edi\],(BYTE PTR )?(ds:)?\[esi\])
[ 	]*[a-f0-9]+:	64 a4 *	movs +BYTE PTR es:\[edi\],(BYTE PTR )?fs:\[esi\]
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR es:\[edi\],(WORD PTR )?(ds:)?\[esi\])
[ 	]*[a-f0-9]+:	66 a5 *	movs(w *| +WORD PTR es:\[edi\],(WORD PTR )?(ds:)?\[esi\])
[ 	]*[a-f0-9]+:	64 66 a5 *	movs +WORD PTR es:\[edi\],(WORD PTR )?fs:\[esi\]
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR es:\[edi\],(DWORD PTR )?(ds:)?\[esi\])
[ 	]*[a-f0-9]+:	a5 *	movs(d *| +DWORD PTR es:\[edi\],(DWORD PTR )?(ds:)?\[esi\])
[ 	]*[a-f0-9]+:	64 a5 *	movs +DWORD PTR es:\[edi\],(DWORD PTR )?fs:?\[esi\]
#pass
