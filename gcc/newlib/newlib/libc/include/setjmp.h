/*
	setjmp.h
	stubs for future use.
*/

#ifndef _SETJMP_H_
#define _SETJMP_H_

#include "_ansi.h"
#include <sys/cdefs.h>
#include <machine/setjmp.h>

_BEGIN_STD_C

void	longjmp (jmp_buf __jmpb, int __retval) __dead2;
int	setjmp (jmp_buf __jmpb) __returns_twice;

_END_STD_C

#endif /* _SETJMP_H_ */

