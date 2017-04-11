# Check 32bit PTWRITE instructions

	.text
_start:
	ptwrite %ecx
	ptwritel %ecx
	ptwrite (%ecx)
	ptwritel (%ecx)

	.intel_syntax noprefix
	ptwrite ecx
	ptwrite DWORD PTR [ecx]
