# Check Illegal 32bit MSR_IMM instructions

	.text
_start:
	rdmsr	 $51515151, %eax
	wrmsrns  %eax, $51515151
