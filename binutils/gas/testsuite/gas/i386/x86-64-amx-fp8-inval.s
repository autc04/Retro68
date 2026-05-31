# Check Illegal AMX-FP8 instructions

	.text
_start:
	tdpbf8ps	%tmm1, %tmm1, %tmm2
	tdpbf8ps	%tmm1, %tmm2, %tmm2
	tdpbhf8ps	%tmm1, %tmm1, %tmm2
	tdpbhf8ps	%tmm1, %tmm2, %tmm2
	tdphbf8ps	%tmm1, %tmm1, %tmm2
	tdphbf8ps	%tmm1, %tmm2, %tmm2
	tdphf8ps	%tmm1, %tmm1, %tmm2
	tdphf8ps	%tmm1, %tmm2, %tmm2
