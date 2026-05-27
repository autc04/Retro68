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
# define ILINES_PER_ITER 8
# define DLINES_PER_ITER 8
#else
/* MIPS Release 6 has a 9-bit signed displacement for CACHE */
#if ILINE_SIZE == 128
# define ILINES_PER_ITER 4 /* Requires both positive and negative disp */
#else
# define ILINES_PER_ITER 8
#endif
#if DLINE_SIZE == 128
# define DLINES_PER_ITER 4 /* Requires both positive and negative disp */
#else
# define DLINES_PER_ITER 8
#endif
#endif

/*
 * Start off pointing to one block below where we want to invalidate the cache
 * as the pointer is moved on at the start of the loop. Also offset the start
 * address for each set of cache lines so that the positive and negative
 * displacements from the CACHE ops can be used.
 */

#define ICACHE_START (0x80000000 - (ILINE_SIZE * ILINES_PER_ITER / 2))
#define ICACHE_END (0x80000000 + ITOTAL_BYTES - (ILINE_SIZE * ILINES_PER_ITER / 2))
#define DCACHE_START (0x80000000 - (DLINE_SIZE * DLINES_PER_ITER / 2))
#define DCACHE_END (0x80000000 + DTOTAL_BYTES - (DLINE_SIZE * DLINES_PER_ITER / 2))

#define CURRENT_ADDR  a0
#define END_ADDR      a1
#define CONFIG	      a2
#define TEMP	      a3

	.set    noat

/*
 * init_icache invalidates all instruction cache entries
 */
#if defined(ILINE_ENC) && ILINE_ENC != 0
LEAF(__init_icache)
	/* Use KSEG0 base address */
	li	CURRENT_ADDR, ICACHE_START
	/* Get the address of the last batch of lines */
	li	END_ADDR, ICACHE_END

	/* Clear TagLo/TagHi registers */
	mtc0	zero, C0_TAGLO
	mtc0	zero, C0_TAGHI

	/*
	 * Index Store Tag Cache Op will invalidate the tag entry, clear
	 * the lock bit, and clear the LRF bit
	 */
$Lnext_icache_tag:
	addu	CURRENT_ADDR, (ILINE_SIZE * ILINES_PER_ITER)
	cache	Index_Store_Tag_I, (ILINE_SIZE*-2)(CURRENT_ADDR)
	cache	Index_Store_Tag_I, (ILINE_SIZE*-1)(CURRENT_ADDR)
	cache	Index_Store_Tag_I, (ILINE_SIZE*0)(CURRENT_ADDR)
	cache	Index_Store_Tag_I, (ILINE_SIZE*1)(CURRENT_ADDR)
#if ILINES_PER_ITER == 8
	cache	Index_Store_Tag_I, (ILINE_SIZE*-4)(CURRENT_ADDR)
	cache	Index_Store_Tag_I, (ILINE_SIZE*-3)(CURRENT_ADDR)
	cache	Index_Store_Tag_I, (ILINE_SIZE*2)(CURRENT_ADDR)
	cache	Index_Store_Tag_I, (ILINE_SIZE*3)(CURRENT_ADDR)
#endif
	bne	CURRENT_ADDR, END_ADDR, $Lnext_icache_tag

$Ldone_icache:
	jr	ra
END(__init_icache)

#endif // ILINE_ENC != 0

/*
 * init_dcache invalidates all data cache entries
 */

#if defined(DLINE_ENC) && DLINE_ENC != 0
LEAF(__init_dcache)
	/* Use KSEG0 base address */
	li	CURRENT_ADDR, DCACHE_START
	/* Get the address of the last batch of lines */
	li	END_ADDR, DCACHE_END

	/* Clear TagLo/TagHi registers */
	mtc0	zero, C0_TAGLO
	mtc0	zero, C0_TAGHI
	mtc0	zero, C0_TAGLO, 2
	mtc0	zero, C0_TAGHI, 2

	/*
	 * Index Store Tag Cache Op will invalidate the tag entry, clear
	 * the lock bit, and clear the LRF bit
	 */
$Lnext_dcache_tag:
	addu	CURRENT_ADDR, (DLINE_SIZE * DLINES_PER_ITER)
	cache	Index_Store_Tag_D, (DLINE_SIZE*-2)(CURRENT_ADDR)
	cache	Index_Store_Tag_D, (DLINE_SIZE*-1)(CURRENT_ADDR)
	cache	Index_Store_Tag_D, (DLINE_SIZE*0)(CURRENT_ADDR)
	cache	Index_Store_Tag_D, (DLINE_SIZE*1)(CURRENT_ADDR)
#if DLINES_PER_ITER == 8
	cache	Index_Store_Tag_D, (DLINE_SIZE*-4)(CURRENT_ADDR)
	cache	Index_Store_Tag_D, (DLINE_SIZE*-3)(CURRENT_ADDR)
	cache	Index_Store_Tag_D, (DLINE_SIZE*2)(CURRENT_ADDR)
	cache	Index_Store_Tag_D, (DLINE_SIZE*3)(CURRENT_ADDR)
#endif
	bne	CURRENT_ADDR, END_ADDR, $Lnext_dcache_tag

$Ldone_dcache:
	jr	ra

END(__init_dcache)
#endif // DLINE_ENC != 0

/*
 * __change_k0_cca essentially turns the cache on
 */

#if ILINE_ENC != 0 || DLINE_ENC != 0
LEAF(__change_k0_cca)
	/*
	 * NOTE! This code must be executed in KSEG1 (not KSEG0 uncached)
	 * Set CCA for kseg0 to cacheable
	 */
	mfc0	CONFIG, C0_CONFIG
	li	TEMP, CFG_C_NONCOHERENT

$Lset_kseg0_cca:
	ins	CONFIG, TEMP, 0, 3
	mtc0	CONFIG, C0_CONFIG
	MIPS_JRHB (ra)

END(__change_k0_cca)
#endif // ILINE_ENC != 0 || DLINE_ENC != 0
