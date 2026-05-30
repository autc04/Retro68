/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

    .global _program_return_code

	.section	".init"
	/*
		Empty.
	*/


	.section	".fini"
	.global	_fini
	.type	_fini,#function
_fini:
    | this occurs after crtend.o have done all global destructors etc.
	move.w	_program_return_code,-(a7)
	move.w	#0x4c,-(a7)
	trap	#1

	.bss
    .lcomm  _program_return_code, 2
