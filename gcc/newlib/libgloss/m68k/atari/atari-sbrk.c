/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <errno.h>
#include <_ansi.h>

extern char *_HeapPtr;
extern char *_heapbase;

char *sbrk(int nbytes)
{
	char *newheap = _HeapPtr + nbytes;

	/*
		The user stack pointer is the top heap.
		The behaviour is undefined if we are in supervisor mode.
		But memory allocations in supervisor mode feels like a bad idea anyway.
	*/
	char *heaptop;
	__asm__ volatile (
		"move.l	%%a7, %0\n\t"
		: "=g" (heaptop)
		:
		:);

	if (newheap > heaptop)
	{
		errno = ENOMEM;
		return ((char *)-1);
	}
	char *retptr = _HeapPtr;
	_HeapPtr = newheap;
	return retptr;
}
