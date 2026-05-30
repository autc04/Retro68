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

#define _BOOTCODE

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include "predef.h"

MIPS_NOMIPS16

/*
 * Depending on the range of the displacement field of the CACHE instruction
 * we can do multiple cacheops per iteration.  With a cache present there
 * is a guarantee of 32 lines minimum so a power of 2 less than or equal
 * to 32 means there is no remainder after the loop.
 * The maximum number of lines per iteration is the range of the CACHE
 * displacement divided by the line_size.  We cap this at 8 as a sensible
 * bound.
 */

#if __mips_isa_rev < 6
/* MicroMIPS Release 3 has a 12-bit displacement for CACHE */
# define SLINES_PER_ITER 8
# define TLINES_PER_ITER 8
#else
/* MIPS Release 6 has a 9-bit signed displacement for CACHE */
#if SLINE_SIZE == 128
# define SLINES_PER_ITER 4 /* Requires both positive and negative disp */
#else
# define SLINES_PER_ITER 8
#endif
#if TLINE_SIZE == 128
# define TLINES_PER_ITER 4 /* Requires both positive and negative disp */
#else
# define TLINES_PER_ITER 8
#endif
#endif

#ifdef MEM_MAPPED_L2C
# error MEM_MAPPED_L2C used with Config L2 code
#endif

/*
 * Start off pointing to one block below where we want to invalidate the cache
 * as the pointer is moved on at the start of the loop. Also offset the start
 * address for each set of cache lines so that the positive and negative
 * displacements from the CACHE ops can be used.
 */

#define SCACHE_START (0x80000000 - (SLINE_SIZE * SLINES_PER_ITER / 2))
#define SCACHE_END (0x80000000 + STOTAL_BYTES - (SLINE_SIZE * SLINES_PER_ITER / 2))
#define TCACHE_START (0x80000000 - (TLINE_SIZE * TLINES_PER_ITER / 2))
#define TCACHE_END (0x80000000 + TTOTAL_BYTES - (TLINE_SIZE * TLINES_PER_ITER / 2))

#define CURRENT_ADDR  a0
#define END_ADDR      a1
#define CONFIG	      a2
#define TEMP	      a3

	.set	noat

/*
 * __init_l23cache invalidates all secondary/tertiary data cache entries
 */

#if defined(SLINE_ENC) && SLINE_ENC != 0
LEAF(__init_l23cache)
	/* Use KSEG0 base address */
	li    CURRENT_ADDR, SCACHE_START 
	/* Get the address of the last batch of lines */
	li    END_ADDR, SCACHE_END

	/* Clear TagLo/TagHi registers */
	mtc0    zero, C0_TAGLO, 4

	/*
	 * Index Store Tag Cache Op will invalidate the tag entry, clear
	 * the lock bit, and clear the LRF bit
	 */
$Lnext_scache_tag:
	addu	CURRENT_ADDR, (SLINE_SIZE * SLINES_PER_ITER)
	cache	Index_Store_Tag_S, (SLINE_SIZE*-2)(CURRENT_ADDR)
	cache	Index_Store_Tag_S, (SLINE_SIZE*-1)(CURRENT_ADDR)
	cache	Index_Store_Tag_S, (SLINE_SIZE*0)(CURRENT_ADDR)
	cache	Index_Store_Tag_S, (SLINE_SIZE*1)(CURRENT_ADDR)
#if SLINES_PER_ITER == 8
	cache	Index_Store_Tag_S, (SLINE_SIZE*-4)(CURRENT_ADDR)
	cache	Index_Store_Tag_S, (SLINE_SIZE*-3)(CURRENT_ADDR)
	cache	Index_Store_Tag_S, (SLINE_SIZE*2)(CURRENT_ADDR)
	cache	Index_Store_Tag_S, (SLINE_SIZE*3)(CURRENT_ADDR)
#endif
	bne	CURRENT_ADDR, END_ADDR, $Lnext_scache_tag

$Ldone_scache:

#if defined(TLINE_ENC) && TLINE_ENC != 0

	/* Use KSEG0 base address */
	li	CURRENT_ADDR, TCACHE_START
	/* Get the address of the last batch of lines */
	li	END_ADDR, TCACHE_END

	/* Clear TagLo/TagHi registers */
	mtc0	zero, C0_TAGLO, 4

	/*
	 * Index Store Tag Cache Op will invalidate the tag entry, clear
	 * the lock bit, and clear the LRF bit
	 */
$Lnext_tcache_tag:
	addu	CURRENT_ADDR, (TLINE_SIZE * TLINES_PER_ITER)
	cache	Index_Store_Tag_T, (TLINE_SIZE*-2)(CURRENT_ADDR)
	cache	Index_Store_Tag_T, (TLINE_SIZE*-1)(CURRENT_ADDR)
	cache	Index_Store_Tag_T, (TLINE_SIZE*0)(CURRENT_ADDR)
	cache	Index_Store_Tag_T, (TLINE_SIZE*1)(CURRENT_ADDR)
#if TLINES_PER_ITER == 8
	cache	Index_Store_Tag_T, (TLINE_SIZE*-4)(CURRENT_ADDR)
	cache	Index_Store_Tag_T, (TLINE_SIZE*-3)(CURRENT_ADDR)
	cache	Index_Store_Tag_T, (TLINE_SIZE*2)(CURRENT_ADDR)
	cache	Index_Store_Tag_T, (TLINE_SIZE*3)(CURRENT_ADDR)
#endif
	bne	CURRENT_ADDR, END_ADDR, $Lnext_tcache_tag

$Ldone_tcache:

#endif // TLINE_ENC != 0
	jr	ra
END(__init_l23cache)

LEAF(__init_l23cache_cached)
	jr	ra
END(__init_l23cache_cached)

#endif // SLINE_ENC != 0
