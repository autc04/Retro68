# Check 64bit APX_F JMPABS instructions

	.text
 _start:
	jmpabs	$thunk
	jmpabs	$2
	jmpabs	$0x87654321
	jmpabs	$0x987654321

	.intel_syntax noprefix
	jmpabs	thunk
	jmpabs	0x12345678
	jmpabs	0x87654321
	jmpabs	0x987654321
