# Check 64bit NOTRACK prefix

	.allow_index_reg
	.text
_start:
	notrack call *%rax
	notrack call *%r8
	notrack jmp *%rax
	notrack jmp *%r8

	notrack call *(%rax)
	notrack call *(%r8)
	notrack jmp *(%rax)
	notrack jmp *(%r8)

	notrack call *(%eax)
	notrack call *(%r8d)
	notrack jmp *(%eax)
	notrack jmp *(%r8d)

	bnd notrack call *%rax
	bnd notrack call *%r8
	bnd notrack jmp *%rax
	bnd notrack jmp *%r8

	bnd notrack call *(%rax)
	bnd notrack call *(%r8)
	bnd notrack jmp *(%rax)
	bnd notrack jmp *(%r8)

	bnd notrack call *(%eax)
	bnd notrack call *(%r8d)
	bnd notrack jmp *(%eax)
	bnd notrack jmp *(%r8d)

	.intel_syntax noprefix
	notrack call rax
	notrack call r8
	notrack jmp rax
	notrack jmp r8

	notrack call QWORD PTR [rax]
	notrack call QWORD PTR [r8]
	notrack jmp QWORD PTR [rax]
	notrack jmp QWORD PTR [r8]

	notrack call QWORD PTR [eax]
	notrack call QWORD PTR [r8d]
	notrack jmp QWORD PTR [eax]
	notrack jmp QWORD PTR [r8d]

	bnd notrack call rax
	bnd notrack call r8
	bnd notrack jmp rax
	bnd notrack jmp r8

	bnd notrack call QWORD PTR [rax]
	bnd notrack call QWORD PTR [r8]
	bnd notrack jmp QWORD PTR [rax]
	bnd notrack jmp QWORD PTR [r8]

	bnd notrack call QWORD PTR [eax]
	bnd notrack call QWORD PTR [r8d]
	bnd notrack jmp QWORD PTR [eax]
	bnd notrack jmp QWORD PTR [r8d]

	# ds bnd callq *%rax
	.byte 0x3e
	.byte 0xf2
	.byte 0xff
	.byte 0xd0

	# ds callw *%ax
	.byte 0x3e
	.byte 0x66
	.byte 0xff
	.byte 0xd0

	# ds callw *%ax
	.byte 0x66
	.byte 0x3e
	.byte 0xff
	.byte 0xd0
