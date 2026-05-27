# Test a white space before argument added by C preprocessor.

	.macro WRAPPER_IMPL_SSE2 callee
	call *\ callee@GOTPCREL(%rip)
	.endm

	.text
_start:
	WRAPPER_IMPL_SSE2 acos
