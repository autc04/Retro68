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

MIPS_NOMIPS16

#define LINE_SIZE     vt0
#define SET_SIZE      vt1
#define ASSOC	      a0
#define TOTAL_BYTES   a1
#define CURR_ADDR1    a2
#define CURR_ADDR2    a3
#define END_ADDR      t0 
#define CONFIG	      t1
#define CONFIG1	      t2
#define TEMP	      t3

    .set    noat

/*
 * init_icache invalidates all instruction cache entries
 */

LEAF(__init_icache)
	mfc0	CONFIG1, C0_CONFIG1

	ext	LINE_SIZE, CONFIG1, CFG1_IL_SHIFT, 3

	/* Skip ahead if No I$ */
	li	TEMP, 2
	beqz	LINE_SIZE, $Ldone_icache
	sllv	LINE_SIZE, TEMP, LINE_SIZE	  /* Now have true I$ line size in bytes */

	ext	SET_SIZE, CONFIG1, CFG1_IS_SHIFT, 3
	addiu	SET_SIZE, SET_SIZE, 1		  /* Rotate to account for 7 == 32 sets */
	andi	SET_SIZE, SET_SIZE, 7		  /* Mask down to 3-bit */
	li	TEMP,	32
	sllv	SET_SIZE, TEMP, SET_SIZE	  /* I$ Sets per way */

	// Config1IA == I$ Assoc - 1
	ext	ASSOC, CONFIG1, CFG1_IA_SHIFT, 3
	addiu	ASSOC, ASSOC, 1

	mul	SET_SIZE, SET_SIZE, ASSOC	  /* Total number of sets */
	mul	TOTAL_BYTES, SET_SIZE, LINE_SIZE  /* Total number of bytes */

	li	CURR_ADDR2, 0x80000000		  /* Get a KSeg0 address for cacheops */
	subu	CURR_ADDR2, CURR_ADDR2, LINE_SIZE /* Pre-bias the addresses as the loop */
	subu	CURR_ADDR1, CURR_ADDR2, LINE_SIZE /* increments them first */

	addu	END_ADDR, CURR_ADDR1, TOTAL_BYTES /* END_ADDR is last line to invalidate */
	sll	LINE_SIZE, LINE_SIZE, 1		  /* Double line size as we process two */
						  /* per loop */

	/* Clear TagLo/TagHi registers */
	mtc0	zero, C0_TAGLO
	mtc0	zero, C0_TAGHI

$Lnext_icache_tag:
	/*
	 * Index Store Tag Cache Op will invalidate the tag entry, clear
	 * the lock bit, and clear the LRF bit
	 */
	addu	CURR_ADDR1, LINE_SIZE
	addu	CURR_ADDR2, LINE_SIZE
	cache	Index_Store_Tag_I, 0(CURR_ADDR1)
	cache	Index_Store_Tag_I, 0(CURR_ADDR2)
	bne	CURR_ADDR1, END_ADDR, $Lnext_icache_tag

$Ldone_icache:
	jr	ra
END(__init_icache)

/*
 * init_dcache invalidates all data cache entries
 */

LEAF(__init_dcache)
	mfc0	CONFIG1, C0_CONFIG1
	ext	LINE_SIZE, CONFIG1, CFG1_DL_SHIFT, 3

	/* Skip ahead if No D$ */
	li	TEMP, 2
	beqz	LINE_SIZE, $Ldone_dcache

	sllv	LINE_SIZE, TEMP, LINE_SIZE	  /* Now have true D$ line size in bytes */

	ext	SET_SIZE, CONFIG1, CFG1_DS_SHIFT, 3
	addiu	SET_SIZE, SET_SIZE, 1		  /* Rotate to account for 7 == 32 sets */
	andi	SET_SIZE, SET_SIZE, 7		  /* Mask down to 3-bit */
	li	TEMP, 32
	sllv	SET_SIZE, TEMP, SET_SIZE	  /* D$ Sets per way */

	/* Config1.DA == D$ Assoc - 1 */
	ext	ASSOC, CONFIG1, CFG1_DA_SHIFT, 3
	addiu	ASSOC, 1

	mul	SET_SIZE, SET_SIZE, ASSOC	  /* Get total number of sets */
	mul	TOTAL_BYTES, SET_SIZE, LINE_SIZE  /* Total number of bytes */

	li	CURR_ADDR2, 0x80000000		  /* Get a KSeg0 address for cacheops */
	subu	CURR_ADDR2, CURR_ADDR2, LINE_SIZE /* Pre-bias the addresses as the loop */
	subu	CURR_ADDR1, CURR_ADDR2, LINE_SIZE /* increments them first */

	addu	END_ADDR, CURR_ADDR1, TOTAL_BYTES /* END_ADDR is last line to invalidate */
	sll	LINE_SIZE, LINE_SIZE, 1		  /* Double line size as we process two */
						  /* per loop*/

	/* Clear TagLo/TagHi registers */
	mtc0	zero, C0_TAGLO
	mtc0	zero, C0_TAGHI
	mtc0	zero, C0_TAGLO, 2
	mtc0	zero, C0_TAGHI, 2

$Lnext_dcache_tag:
	/*
	 * Index Store Tag Cache Op will invalidate the tag entry, clear
	 * the lock bit, and clear the LRF bit
	 */
	addu	CURR_ADDR1, LINE_SIZE
	addu	CURR_ADDR2, LINE_SIZE
	cache	Index_Store_Tag_D, 0(CURR_ADDR1)
	cache	Index_Store_Tag_D, 0(CURR_ADDR2)
	bne	CURR_ADDR1, END_ADDR, $Lnext_dcache_tag

$Ldone_dcache:
	jr	ra

END(__init_dcache)

/*
 * __change_k0_cca essentially turns the cache on
 */

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
