# Check 64bit AMX-MOVRS instructions

	.text
_start:
	tileloaddrs	0x10000000(%rbp, %r14, 8), %tmm6
	tileloaddrs	(%r9), %tmm3
	tileloaddrst1	0x10000000(%rbp, %r14, 8), %tmm6
	tileloaddrst1	(%r9), %tmm3

_intel:
	.intel_syntax noprefix
	tileloaddrs	tmm6, [rbp+r14*8+0x10000000]
	tileloaddrs	tmm3, [r9]
	tileloaddrst1	tmm6, [rbp+r14*8+0x10000000]
	tileloaddrst1	tmm3, [r9]
