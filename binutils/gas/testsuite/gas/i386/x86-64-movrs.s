# Check 64bit MOVRS instructions

	.text
_start:
	movrs	0x10000000(%rbp, %r14, 8), %dx
	movrs	(%r9), %dx
	movrs	254(%rcx), %dx
	movrs	-256(%rdx), %dx
	movrs	0x10000000(%rbp, %r14, 8), %edx
	movrs	(%r9), %edx
	movrs	508(%rcx), %edx
	movrs	-512(%rdx), %edx
	movrs	0x10000000(%rbp, %r14, 8), %r12
	movrs	(%r9), %r12
	movrs	1016(%rcx), %r12
	movrs	-1024(%rdx), %r12
	movrs	0x10000000(%rbp, %r14, 8), %bl
	movrs	(%r9), %bl
	movrs	127(%rcx), %bl
	movrs	-128(%rdx), %bl
	prefetchrst2	0x10000000(%rbp, %r14, 8)
	prefetchrst2	(%r9)
	prefetchrst2	127(%rcx)
	prefetchrst2	-128(%rdx)

_intel:
	.intel_syntax noprefix
	movrs	dx, WORD PTR [rbp+r14*8+0x10000000]
	movrs	dx, WORD PTR [r9]
	movrs	dx, WORD PTR [rcx+254]
	movrs	dx, WORD PTR [rdx-256]
	movrs	edx, DWORD PTR [rbp+r14*8+0x10000000]
	movrs	edx, DWORD PTR [r9]
	movrs	edx, DWORD PTR [rcx+508]
	movrs	edx, DWORD PTR [rdx-512]
	movrs	r12, QWORD PTR [rbp+r14*8+0x10000000]
	movrs	r12, QWORD PTR [r9]
	movrs	r12, QWORD PTR [rcx+1016]
	movrs	r12, QWORD PTR [rdx-1024]
	movrs	bl, BYTE PTR [rbp+r14*8+0x10000000]
	movrs	bl, BYTE PTR [r9]
	movrs	bl, BYTE PTR [rcx+127]
	movrs	bl, BYTE PTR [rdx-128]
	prefetchrst2	BYTE PTR [rbp+r14*8+0x10000000]
	prefetchrst2	BYTE PTR [r9]
	prefetchrst2	BYTE PTR [rcx+127]
	prefetchrst2	BYTE PTR [rdx-128]
