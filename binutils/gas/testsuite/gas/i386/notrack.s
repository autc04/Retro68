# Check 32bit NOTRACK prefix

	.allow_index_reg
	.text
_start:
	notrack call *%eax
	notrack call *%ax
	notrack jmp *%eax
	notrack jmp *%ax

	notrack call *(%eax)
	notrack callw *(%eax)
	notrack jmp *(%eax)
	notrack jmpw *(%eax)

	bnd notrack call *%eax
	bnd notrack call *%ax
	bnd notrack jmp *%eax
	bnd notrack jmp *%ax

	bnd notrack call *(%eax)
	bnd notrack callw *(%eax)
	bnd notrack jmp *(%eax)
	bnd notrack jmpw *(%eax)

	.intel_syntax noprefix
	notrack call eax
	notrack call ax
	notrack jmp eax
	notrack jmp ax

	notrack call DWORD PTR [eax]
	notrack call WORD PTR [eax]
	notrack jmp DWORD PTR [eax]
	notrack jmp WORD PTR [eax]

	bnd notrack call eax
	bnd notrack call ax
	bnd notrack jmp eax
	bnd notrack jmp ax

	bnd notrack call DWORD PTR [eax]
	bnd notrack call WORD PTR [eax]
	bnd notrack jmp DWORD PTR [eax]
	bnd notrack jmp WORD PTR [eax]

	# ds bnd call *%eax
	.byte 0x3e
	.byte 0xf2
	.byte 0xff
	.byte 0xd0

	# ds callw *%ax
	.byte 0x3e
	.byte 0x66
	.byte 0xff
	.byte 0xd0
