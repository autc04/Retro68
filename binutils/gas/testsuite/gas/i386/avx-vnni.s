	.allow_index_reg

.macro test_insn mnemonic
	\mnemonic	%xmm2, %xmm4, %xmm2
	{evex} \mnemonic %xmm2, %xmm4, %xmm2
	{vex}  \mnemonic %xmm2, %xmm4, %xmm2
	{vex3} \mnemonic %xmm2, %xmm4, %xmm2
	{vex}  \mnemonic (%ecx), %xmm4, %xmm2
	{vex3} \mnemonic (%ecx), %xmm4, %xmm2
.endm

	.text
_start:
	test_insn vpdpbusd
	test_insn vpdpwssd
	test_insn vpdpbusds
	test_insn vpdpwssds

	.arch .avx_vnni
	 vpdpbusd	%xmm2, %xmm4, %xmm2
