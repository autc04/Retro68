# Check Illegal AMX-TRANSPOSE instructions

	.text
_start:
	t2rpntlvwz0rs	(%r9), %tmm2
	t2rpntlvwz0rst1	(%r9), %tmm2
	t2rpntlvwz1rs	(%r9), %tmm2
	t2rpntlvwz1rst1	(%r9), %tmm2
	ttmmultf32ps	%tmm1, %tmm2, %tmm3

	.arch .amx_transpose
_transpose:
	ttdpbf16ps	%tmm1, %tmm1, %tmm2
	ttdpbf16ps	%tmm1, %tmm2, %tmm1
	ttdpbf16ps	%tmm2, %tmm1, %tmm1
	ttdpfp16ps	%tmm1, %tmm1, %tmm2
	ttdpfp16ps	%tmm1, %tmm2, %tmm1
	ttdpfp16ps	%tmm2, %tmm1, %tmm1
	ttmmultf32ps	%tmm1, %tmm1, %tmm2
	ttmmultf32ps	%tmm1, %tmm2, %tmm1
	ttmmultf32ps	%tmm2, %tmm1, %tmm1
	t2rpntlvwz0	(%rip), %tmm2
	t2rpntlvwz0t1	(%rip), %tmm2
	t2rpntlvwz1	(%rip), %tmm2
	t2rpntlvwz1t1	(%rip), %tmm2
	t2rpntlvwz0rs	(%rip), %tmm2
	t2rpntlvwz0rst1	(%rip), %tmm2
	t2rpntlvwz1rs	(%rip), %tmm2
	t2rpntlvwz1rst1	(%rip), %tmm2
	t2rpntlvwz0	(%r9), %tmm1
	t2rpntlvwz0t1	(%r9), %tmm3
	t2rpntlvwz1	(%r9), %tmm5
	t2rpntlvwz1t1	(%r9), %tmm7
	t2rpntlvwz0rs	(%r9), %tmm1
	t2rpntlvwz0rst1	(%r9), %tmm3
	t2rpntlvwz1rs	(%r9), %tmm5
	t2rpntlvwz1rst1	(%r9), %tmm7
