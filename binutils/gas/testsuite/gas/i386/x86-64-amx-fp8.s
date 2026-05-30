# Check 64bit AMX-FP8 instructions

	.text
_start:
	tdpbf8ps	%tmm4, %tmm5, %tmm6
	tdpbf8ps	%tmm1, %tmm2, %tmm3
	tdpbhf8ps	%tmm4, %tmm5, %tmm6
	tdpbhf8ps	%tmm1, %tmm2, %tmm3
	tdphbf8ps	%tmm4, %tmm5, %tmm6
	tdphbf8ps	%tmm1, %tmm2, %tmm3
	tdphf8ps	%tmm4, %tmm5, %tmm6
	tdphf8ps	%tmm1, %tmm2, %tmm3

_intel:
	.intel_syntax noprefix
	tdpbf8ps	tmm6, tmm5, tmm4
	tdpbf8ps	tmm3, tmm2, tmm1
	tdpbhf8ps	tmm6, tmm5, tmm4
	tdpbhf8ps	tmm3, tmm2, tmm1
	tdphbf8ps	tmm6, tmm5, tmm4
	tdphbf8ps	tmm3, tmm2, tmm1
	tdphf8ps	tmm6, tmm5, tmm4
	tdphf8ps	tmm3, tmm2, tmm1
