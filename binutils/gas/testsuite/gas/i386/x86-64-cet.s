# Check 64bit CET instructions
	.text
_start:
	incsspd %r12d
	incsspq %rax
	rdsspd %r12d
	rdsspq %rax
	saveprevssp
	rstorssp (%r12)
	wrssd %eax, (%r12)
	wrssq %rdx, (%rcx, %r15)
	wrussd %eax, (%r12)
	wrussq %rcx, (%rbx, %rax)
	setssbsy
	clrssbsy (%rsi, %r12)
	endbr64
	endbr32

	.intel_syntax noprefix
	incsspd r12d
	incsspq rax
	rdsspd r12d
	rdsspq rax
	saveprevssp
	rstorssp QWORD PTR [r12]
	wrssd [r12],eax
	wrssq [rcx+r15],rdx
	wrussd [r12],eax
	wrussq [rbx+rax],rcx
	setssbsy
	clrssbsy QWORD PTR [rsi+r12]
	endbr64
	endbr32
