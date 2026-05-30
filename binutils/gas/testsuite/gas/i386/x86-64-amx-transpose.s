# Check 64bit AMX-TRANSPOSE instructions

	.arch .amx_transpose
	.text
_start:
	ttdpbf16ps	%tmm4, %tmm5, %tmm6
	ttdpbf16ps	%tmm1, %tmm2, %tmm3
	ttdpfp16ps	%tmm4, %tmm5, %tmm6
	ttdpfp16ps	%tmm1, %tmm2, %tmm3
	ttransposed	%tmm5, %tmm6
	ttransposed	%tmm2, %tmm3
	t2rpntlvwz0	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz0	(%r9), %tmm2
	t2rpntlvwz0t1	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz0t1	(%r9), %tmm2
	t2rpntlvwz1	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz1	(%r9), %tmm2
	t2rpntlvwz1t1	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz1t1	(%r9), %tmm2
	t2rpntlvwz0rs	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz0rs	(%r9), %tmm2
	t2rpntlvwz0rst1	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz0rst1	(%r9), %tmm2
	t2rpntlvwz1rs	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz1rs	(%r9), %tmm2
	t2rpntlvwz1rst1	0x10000000(%rbp, %r14, 8), %tmm6
	t2rpntlvwz1rst1	(%r9), %tmm2
	tconjtcmmimfp16ps	%tmm4, %tmm5, %tmm6
	tconjtcmmimfp16ps	%tmm1, %tmm2, %tmm3
	tconjtfp16	%tmm5, %tmm6
	tconjtfp16	%tmm2, %tmm3
	ttcmmimfp16ps	%tmm4, %tmm5, %tmm6
	ttcmmimfp16ps	%tmm1, %tmm2, %tmm3
	ttcmmrlfp16ps	%tmm4, %tmm5, %tmm6
	ttcmmrlfp16ps	%tmm1, %tmm2, %tmm3
	ttmmultf32ps	%tmm4, %tmm5, %tmm6
	ttmmultf32ps	%tmm1, %tmm2, %tmm3

_intel:
	.intel_syntax noprefix
	ttdpbf16ps	tmm6, tmm5, tmm4
	ttdpbf16ps	tmm3, tmm2, tmm1
	ttdpfp16ps	tmm6, tmm5, tmm4
	ttdpfp16ps	tmm3, tmm2, tmm1
	ttransposed	tmm6, tmm5
	ttransposed	tmm3, tmm2
	t2rpntlvwz0	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz0	tmm2, [r9]
	t2rpntlvwz0t1	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz0t1	tmm2, [r9]
	t2rpntlvwz1	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz1	tmm2, [r9]
	t2rpntlvwz1t1	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz1t1	tmm2, [r9]
	t2rpntlvwz0rs	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz0rs	tmm2, [r9]
	t2rpntlvwz0rst1	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz0rst1	tmm2, [r9]
	t2rpntlvwz1rs	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz1rs	tmm2, [r9]
	t2rpntlvwz1rst1	tmm6, [rbp+r14*8+0x10000000]
	t2rpntlvwz1rst1	tmm2, [r9]
	tconjtcmmimfp16ps       tmm6, tmm5, tmm4
	tconjtcmmimfp16ps       tmm3, tmm2, tmm1
	tconjtfp16      tmm6, tmm5
	tconjtfp16      tmm3, tmm2
	ttcmmimfp16ps   tmm6, tmm5, tmm4
	ttcmmimfp16ps   tmm3, tmm2, tmm1
	ttcmmrlfp16ps   tmm6, tmm5, tmm4
	ttcmmrlfp16ps   tmm3, tmm2, tmm1
	ttmmultf32ps	tmm6, tmm5, tmm4
	ttmmultf32ps	tmm3, tmm2, tmm1
