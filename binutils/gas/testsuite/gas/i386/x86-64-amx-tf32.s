# Check 64bit AMX-TF32 instructions

	.text
_start:
	tmmultf32ps	%tmm4, %tmm5, %tmm6
	tmmultf32ps	%tmm1, %tmm2, %tmm3

_intel:
	.intel_syntax noprefix
	tmmultf32ps	tmm6, tmm5, tmm4
	tmmultf32ps	tmm3, tmm2, tmm1
