# Check 64bit unsupported NOTRACK prefix

	.allow_index_reg
	.text
_start:
	notrack call foo
	notrack jmp foo

	fs notrack call *%rax
	notrack fs call *%rax
	notrack bnd call *%rax
	notrack data16 call *%rax

	.intel_syntax noprefix
	fs notrack call rax
	notrack fs call rax
	notrack bnd call rax
	notrack data16 call rax
