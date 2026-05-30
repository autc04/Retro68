/*
 * Copyright (C) 2014-2018 MIPS Tech, LLC
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * 3. Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from this
 * software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
*/

#define _FUNCTION_SECTIONS_

#include <mips/regdef.h>
#include <mips/asm.h>
#include <mips/cpu.h>

.set	noat
MIPS_NOMIPS16

.extern	__isr_vec_fallback

/* For the vectors shared between VINT and VEIC we rename the numeric
 * vector indices to the named form instead.  */

#define	_mips_isr_000 _mips_isr_sw0
#define	_mips_isr_001 _mips_isr_sw1
#define	_mips_isr_002 _mips_isr_hw0
#define	_mips_isr_003 _mips_isr_hw1
#define	_mips_isr_004 _mips_isr_hw2
#define	_mips_isr_005 _mips_isr_hw3
#define	_mips_isr_006 _mips_isr_hw4
#define	_mips_isr_007 _mips_isr_hw5

.extern	REF
.weak	ISR

#ifdef __mips_micromips
# define NOP nop32
#else
# define NOP nop
#endif

_TEXT_SECTION_NAMED(DEF);
/* The alignment used here must match __isr_vec_space.  */
	.balign (SZPTR * 8);
	.globl  DEF;
	.ent    DEF;
DEF:
	NOP		  /* May become: mtc0 k1, C0_KSCRATCH1 */
	LA	k1, ISR
	beqz	k1, __isr_vec_fallback
	jr	k1
END(DEF)
