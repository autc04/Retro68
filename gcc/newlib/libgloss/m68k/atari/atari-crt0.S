/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

	.global exit
	.global _atari_argv		| in atari-environ.c
	.global _atari_argc		| in atari-environ.c

	.section	".init"
	.global	__call_main_with_argc_argv
	.type	__call_main_with_argc_argv,#function
__call_main_with_argc_argv:

    | this occurs after crtbegin.o have done all global constructors etc.
	| atari-crti.S have already set up _atari_argc, _atari_argv
	move.l	_atari_argv, -(a7)
	move.l	_atari_argc, -(a7)
	jsr		main
	addq.l	#8, a7
	move.l	d0, -(a7)
	jsr		exit			| not expected to return
	illegal

	.global _exit
	.type	_exit,#function
_exit:
	move.l 4(a7), d0
	move.w	d0, _program_return_code
    | crtend.o follows here with global destructors etc.

