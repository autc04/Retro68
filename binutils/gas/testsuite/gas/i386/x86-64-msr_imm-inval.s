# Check Illegal 64bit MSR_IMM instructions

	.text
_start:
	rdmsr  $5151515151515151, %r12
	rdmsr  $-515151, %r12
	wrmsrns  %r12, $5151515151515151
	wrmsrns  %r12, $-515151
