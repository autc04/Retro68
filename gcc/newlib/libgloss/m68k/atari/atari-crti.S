/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#ifdef _HAVE_INITFINI_ARRAY
#define _init	__libc_init_array
#define _fini	__libc_fini_array
#endif

	.equ	MINKEEP, 0x10000

	.global _BasePage
	.weak 	_stksize
	.global _HeapPtr
	.global _heapbase
	.global _atari_4ba_at_prg_start
	.global _atari_4be_at_prg_start
	.global __BSS_SEGMENT_END

	.section	".init"
	.global	_init
	.type	_init,#function
_init:
	move.l	4(a7),a0
	move.l	a0, _BasePage

/*
	First do a quick jump into supervisor mode to get some needed pointers.
*/
	move.l	#super_init, -(a7)
	move.w	#0x26, -(a7)
	trap	#14
	addq.l	#6, a7

/*
	Make an estimate for how much memory we need to reserve for environment and arguments.
*/
	jsr		estimate_env_and_args_memory				| in atari-environ.c
	| d0 contains the number of bytes we need to reserve for environment and arguments.
	move.l	d0, d7
	
/*
	Init stack and heap.
	The size of the stack and heap together is specified in _stksize.
	The stack is set to point at the top of the reserved memory.
	The heap is set to point at the bottom of the reserved memory.
	Usage of _stksize (mintlib functionally compatible):
		if _stksize is undefined, then all available memory is used.
		if _stksize is 0, then MINKEEP memory is used.
		if _stksize > 0 && < 4, then _stksize/4 of all memory is used.
		if _stksize >= 4, then use that much memory.
		if _stksize == -1, then all available memory is used.
		if _stksize < -1, then use -_stksize memory.
*/
	lea		__BSS_SEGMENT_END, a2
	add.l	d7, a2			| environment and arguments
	move.l	a2, _heapbase
	move.l	a2, _HeapPtr

	move.l	_BasePage, a0
	move.l	4(a0), d1		| mem top
	sub.l	a2, d1			| free mem
	move.l	d1, d6
	lea		_stksize, a1
	cmpa.w	#0, a1
	jeq		stksize_selected
	move.l	(a1), d0
	jeq		stksize_zero
	jmi		stksize_negative
stksize_positive:
	moveq	#4, d2
	cmp.l	d2, d0
	jpl		stksize_above_three
stksize_one_to_three:
	lsr.l	#2, d1
	move.l	d1, d2
1:
	subq.w	#1, d0
	jeq		stksize_selected
	add.l	d2, d1
	jra		1b
stksize_zero:
	move.l	#MINKEEP, d1
	jra		stksize_selected
stksize_negative:
	not.l	d0
	jeq		stksize_selected	| -1
	addq.l	#1, d0				| d0 = -_stksize
stksize_above_three:
	move.l	d0, d1
stksize_selected:

	| adjust for memory needed for environment and arguments
	add.l	d7, d1
	cmp.l	d1, d6
	jpl		1f
	move.l	d6, d1
1:

	add.l	a2, d1
	bclr	#0, d1		| even address.
	move.l	d1, a7

	sub.l	a0, d1		| mem from basepage to top.

	| Shrink mem.
	move.l	d1, -(a7)
	move.l	a0, -(a7)
	clr.w	-(a7)
	move.w	#0x4a, -(a7)	| Mshrink()
	trap	#1
	lea		12(a7), a7
	tst.l	d0
	jpl		heap_setup_done
    | Error, just quit with d0 as return code.
	move.w	d0,-(a7)
	move.w	#0x4c,-(a7)
	trap	#1
super_init:
	| Init stuff that needs supervisor mode set.
	move.l	0x4ba, _atari_4ba_at_prg_start
	move.l	0x4be, _atari_4be_at_prg_start
	rts
heap_setup_done:

	pea		__BSS_SEGMENT_END				| storage space for environment and arguments
	jsr		setup_env_and_args				| in atari-environ.c

    | crtbegin.o follows here with global constructors etc. init.


	.section	".fini"
	/*
		Empty.
	*/


	.bss
	.lcomm 	_BasePage, 4
	.lcomm 	_HeapPtr, 4
	.lcomm 	_heapbase, 4
	.lcomm	_atari_4ba_at_prg_start, 4
	.lcomm	_atari_4be_at_prg_start, 4
	.even