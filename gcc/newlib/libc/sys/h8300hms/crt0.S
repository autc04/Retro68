; H8/300, H8/300H, H8/300S and H8SX start up file.

#include "setarch.h"

#ifdef __H8300__

	.section .text
	.global	_start
_start:
	mov.w	#_stack,sp
	mov.w	#_edata,r0
	mov.w	#_end,r2
	sub.w	r1,r1
	sub.w	r0,r2
	jsr	@_memset
#ifdef __ELF__
	mov.w	#__fini,r0
	jsr	@_atexit
#ifdef __SIMULATOR__
	jsr	@0xcc
#endif
	jsr	@__init
#else
#ifdef __SIMULATOR__
	jsr	@0xcc
#endif
	jsr	@___main
#endif
	jsr	@_main
	jsr	@_exit

	.section .stack, "aw", @nobits
_stack:	.space	2

#endif

#if defined (__H8300H__) || defined (__H8300S__) || defined (__H8300SX__)

	.section .text
	.global	_start
_start:
#ifdef __NORMAL_MODE__
	mov.w	#_stack,sp
	mov.w	#_edata,r0
	mov.w	#_end,r2
	sub.l	er1,er1
	sub.w	r0,r2
#else
	mov.l	#_stack,sp
	mov.l	#_edata,er0
	mov.l	#_end,er2
	sub.l	er1,er1
	sub.l	er0,er2
#endif
	jsr	@_memset
#ifdef __ELF__
#ifdef __NORMAL_MODE__
	mov.w	#__fini,r0
#else
	mov.l	#__fini,er0
#endif
	jsr	@_atexit
#ifdef __SIMULATOR__
	jsr	@0xcc
#endif
	jsr	@__init
#else
#ifdef __SIMULATOR__
	jsr	@0xcc
#endif
	jsr	@___main
#endif
	jsr	@_main
	jsr	@_exit

	.section .stack, "aw", @nobits
#ifdef __NORMAL_MODE__
_stack:	.space	2
#else
_stack:	.space	4
#endif

#endif
