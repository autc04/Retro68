# Check 64bit MSR_IMM instructions

	.text
_start:
	rdmsr $51515151, %r12
	rdmsr $51515151, %rax
	rdmsr $0x7f, %r12
	rdmsr $0x7fff, %r12
	rdmsr $0x80000000, %r12
	rdmsr $51515151, %r24
	wrmsrns %r12, $51515151
	wrmsrns %rax, $51515151
	wrmsrns %r12, $0x7f
	wrmsrns %r12, $0x7fff
	wrmsrns %r12, $0x80000000
	wrmsrns %r24, $51515151

	.intel_syntax noprefix
	rdmsr r12, 51515151
	rdmsr rax, 51515151
	rdmsr r12, 0x7f
	rdmsr r12, 0x7fff
	rdmsr r12, 0x80000000
	rdmsr r24, 51515151
	wrmsrns 51515151, r12
	wrmsrns 51515151, rax
	wrmsrns 0x7f, r12
	wrmsrns 0x7fff, r12
	wrmsrns 0x80000000, r12
	wrmsrns 51515151, r24
