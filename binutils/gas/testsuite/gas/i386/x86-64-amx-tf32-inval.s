# Check Illegal 64bit AMX-TF32 instructions

	.text
_start:
	tmmultf32ps	%tmm1, %tmm1, %tmm2
	tmmultf32ps	%tmm1, %tmm2, %tmm1
	tmmultf32ps	%tmm2, %tmm1, %tmm1
