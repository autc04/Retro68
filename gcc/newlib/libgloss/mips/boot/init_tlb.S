/*
 * Copyright (C) 2015-2018 MIPS Tech, LLC
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

/*
 * int, int __tlb_size();
 *
 * Return number of entries in TLB.
 * Entries in va0, number of sets in va1.
 * Must not use registers t8 or a3
 *
 */
SLEAF(__tlb_size)
	/* first see if we've got a TLB */
	mfc0	t0, C0_CONFIG
	mfc0	t1, C0_CONFIG1
	move	va0, zero

	ext	t0, t0, CFG0_MT_SHIFT, CFG0_MT_BITS
	/* No MMU test, 0 entries */
	beqz	t0, 1f

	/* Fixed Address Translation, 0 entries */
	li	t2, (CFG0_MT_FIXED >> CFG0_MT_SHIFT)
	beq	t0, t2, 1f

	/* Block Address Translator, 0 entries */
	li	t2, (CFG0_MT_BAT >> CFG0_MT_SHIFT)
	beq	t0, t2, 1f

	/* (D)TLB or not? */
	andi	t2, t0, (CFG0_MT_TLB | CFG0_MT_DUAL) >> CFG0_MT_SHIFT
	beqz	t2, 1f

	/*
	 * As per PRA, field holds No. of entries -1
	 * Standard TLBs and Dual TLBs have extension fields.
	 */
	ext	va0, t1, CFG1_MMUS_SHIFT, CFG1_MMUS_BITS
	addiu	va0, va0, 1

	mfc0	t1, C0_CONFIG3
	ext	t1, t1, CFG3_M_SHIFT, 1
	beqz	t1, 1f

	mfc0	t1, C0_CONFIG4
#if __mips_isa_rev < 6
	ext	t3, t1, CFG4_MMUED_SHIFT, CFG4_MMUED_BITS

	li	t2, (CFG4_MMUED_FTLBVEXT >> CFG4_MMUED_SHIFT)
	beq	t3, t2, 2f			/* FTLB + VTLBExt */

	li	t2, (CFG4_MMUED_SIZEEXT >> CFG4_MMUED_SHIFT)
	beq	t3, t2, 3f			/* SizeExt for VTLBEXT */

	li	t2, (CFG4_MMUED_FTLB >> CFG4_MMUED_SHIFT)
	beq	t3, t2, 4f			/* FTLB Size */

	/* No extension */
	jr	ra

3:
	ext	t3, t1, CFG4_MMUSE_SHIFT, CFG4_MMUSE_BITS
	sll	t2, t3, CFG1_MMUS_BITS
	addu	va0, va0, t2
	jr	ra
#endif /* __mips_isa_rev < 6 */
2:
	ext	t2, t1, CFG4_VTLBSEXT_SHIFT, CFG4_VTLBSEXT_BITS
	sll	t2, t2, CFG1_MMUS_BITS
	addu	va0, va0, t2
4:
	/* Skip FTLB size calc if Config MT != 4 */
	li	t3, (CFG0_MT_DUAL >> CFG0_MT_SHIFT)
	bne	t3, t0, 1f

	/* Ways */
	li	t2, 2
	ext	t3, t1, CFG4_FTLBW_SHIFT, CFG4_FTLBW_BITS
	addu	t2, t2, t3

	/* Sets per way */
	ext	t3, t1, CFG4_FTLBS_SHIFT, CFG4_FTLBS_BITS
	li	va1, 1
	sllv	va1, va1, t3

	/* Total sets */
	sllv	t2, t2, t3
	addu	va0, va0, t2

1:	jr	ra
SEND(__tlb_size)

/*
 * void __tlbinvalall()
 *
 * Invalidate the TLB.
 * Must not use register a3
 */
SLEAF(__tlbinvalall)

	mfc0	t0, C0_CONFIG
	and	t2, t0, CFG0_MT_MASK
	beqz	t2, $Lexit		/* Config[MT] test, return if no TLB */

	li	t1, CFG0_MT_BAT
	beq	t1, t2, $Lexit		/* return as there is a BAT */

	li	t1, CFG0_MT_FIXED	/* return as there is a FMT */
	beq	t1, t2, $Lexit

	PTR_MTC0 zero, C0_ENTRYLO0
	PTR_MTC0 zero, C0_ENTRYLO1
	PTR_MTC0 zero, C0_PAGEMASK

	/* Fetch size & number of sets in va0, va1 */
	move	t8, ra
	jal	__tlb_size
	move	ra, t8

	/* If Config4 does not exist then use old method for invalidation */
	mfc0	t1, C0_CONFIG3
	ext	t1, t1, CFG3_M_SHIFT, 1
	beqz	t1, $Llegacy_init

	/* If Config4[IE] = 0, use old method for invalidation */
	mfc0	t9, C0_CONFIG4
	ext     t2, t9, CFG4_IE_SHIFT, CFG4_IE_BITS
	beqz	t2, $Llegacy_init

	/* If Config4[IE] = 1, EHINV loop */
	li	t1, (CFG4_IE_EHINV >> CFG4_IE_SHIFT)
	beq	t1, t2, $Lehinv_init

	/*
	 * If Config4[IE] = 2, tlbinvf loop. Handles Config[MT] being either
	 * 1 or 4.
	 */
	li	t1, (CFG4_IE_INV >> CFG4_IE_SHIFT)
	beq	t1, t2, $Ltlbinvf_init

	/* TLB walk done by hardware, Config4[IE] = 3 */
	mtc0	zero, C0_INDEX
	ehb
	.set	push
	.set	eva
	tlbinvf
	.set	pop
	b	$Lexit

$Ltlbinvf_init:
	/*
	 * TLB walk done by software, Config4[IE] = 2, Config[MT] = 4 or 1
	 *
	 * one TLBINVF is executed with an index in VTLB range to
	 * invalidate all VTLB entries.
	 *
	 * For Dual TLBs additionally, one TLBINVF is executed per FTLB set.
	 */

	/* Flush the VTLB */
	mtc0	zero, C0_INDEX
	ehb
	.set	push
	.set	eva
	tlbinvf
	.set	pop

	/*
	 * For JTLB MMUs (Config[MT] = 1) only 1 tlbinvf is required
	 * early out in that case.
	 */
	mfc0	t0, C0_CONFIG
	ext	t3, t0, CFG0_MT_SHIFT, CFG0_MT_BITS
	li	t1, (CFG0_MT_TLB >> CFG0_MT_SHIFT)
	beq	t1, t3, $Lexit

	/*
	 * va0 contains number of TLB entries
	 * va1 contains number of sets per way
	 */
	lui	t9, %hi(__tlb_stride_length)	/* Fetch the tlb stride for */
	addiu	t9, %lo(__tlb_stride_length)	/* stepping through FTLB sets */
	mul	va1, va1, t9
	subu	t2, va0, va1			/* End pointer */

1:	subu	va0, va0, t9
	mtc0	va0, C0_INDEX
	ehb					/* mtc0, hazard on tlbinvf */
	.set	push
	.set	eva
	tlbinvf
	.set	pop
	bne	va0, t2, 1b

	b	$Lexit

$Lehinv_init:
	/*
	 * Config4[IE] = 1. EHINV supported, but not tlbinvf.
	 *
	 * Invalidate the TLB for R3 onwards by loading EHINV and writing to all
	 * tlb entries.
	 */
	move	t0, zero
	li	t1, C0_ENTRYHI_EHINV_MASK
	mtc0	t1, C0_ENTRYHI
1:
	mtc0	t0, C0_INDEX
	ehb					/* mtc0, hazard on tlbwi */

	tlbwi
	addiu	t0, t0, 1
	bne	va0, t0, 1b

	b	$Lexit

$Llegacy_init:
	/*
	 * Invalidate the TLB for R1 onwards by loading
	 * 0x(FFFFFFFF)KSEG0_BASE into EntryHi and writing it into index 0
	 * incrementing by a pagesize, writing into index 1, etc.
	 */

	/*
	 * If large physical addressing is enabled, load 0xFFFFFFFF
	 * into the top half of EntryHi.
	 */
	move	t0, zero		/* t0 == 0 if XPA disabled */
	mfc0	t9, C0_CONFIG3		/* or not present */
	and	t9, t1, CFG3_LPA
	beqz	t9, $Lno_xpa

	mfc0	t9, C0_PAGEGRAIN
	ext	t9, t1, PAGEGRAIN_ELPA_SHIFT, PAGEGRAIN_ELPA_BITS
	bnez	t9, $Lno_xpa

	li	t0, -1			/* t0 == 0xFFFFFFFF if XPA is used */
$Lno_xpa:
	li	t1, (KSEG0_BASE - 2<<13)

	move	t2, zero
1:	addiu	t1, t1, (2<<13)
	PTR_MTC0 t1, C0_ENTRYHI

	beqz	t0, $Lskip_entryhi
	.set	push
	.set	xpa
	mthc0	t0, C0_ENTRYHI		/* Store 0xFFFFFFFF to upper half of EntryHI */
	.set	pop

$Lskip_entryhi:
	ehb				/* mtc0, hazard on tlbp */

	tlbp				/* Probe for a match */
	ehb				/* tlbp, Hazard on mfc0 */

	mfc0	t8, C0_INDEX
	bgez	t8, 1b			/* Skip this address if it exists */

	mtc0	t2, C0_INDEX
	ehb				/* mtc0, hazard on tlbwi */

	tlbwi
	addiu	t2, t2, 1
	bne	va0, t2, 1b

$Lexit:
	PTR_MTC0 zero, C0_ENTRYHI	/* Unset EntryHI, upper half is cleared */
					/* autmatically as mtc0 writes zeroes */
	MIPS_JRHB	(ra)
SEND(__tlbinvalall)

LEAF(__init_tlb)

	mfc0	t0, C0_CONFIG
	and	t2, t0, CFG0_MT_MASK
	beqz	t2, 1f			/* return if no tlb present */

	li	t1, CFG0_MT_BAT
	beq	t1, t2, 1f		/* return as there is a BAT */

	li	t1, CFG0_MT_FIXED	/* return as there is a FMT */
	beq	t1, t2, 1f

	lui	t1, %hi(__enable_xpa)	/* Test for XPA usage */
	ori	t1, %lo(__enable_xpa)
	beqz	t1, 2f

	mfc0	t0, C0_CONFIG3
	and	t0, t0, CFG3_LPA
	bnez	t0, 3f
	
	/*
	 * Raise an error because XPA was requested but LPA support is not
	 * available.
	 */
	/* Incorrect config supplied, report a boot failure through UHI */
	li      t9, 23
	/* Reason - Predef/requested config incorrect */
	li      a0, 2
	/* Trigger the UHI operation */
	sdbbp   1

3:	li	t1, 1
	mfc0	t0, C0_PAGEGRAIN
	ins	t0, t1, PAGEGRAIN_ELPA_SHIFT, PAGEGRAIN_ELPA_BITS
	mtc0	t0, C0_PAGEGRAIN
2:
	move	a3, ra
	jal	__tlbinvalall
	move	ra, a3

	mtc0	zero, C0_PAGEMASK
1:	jr	ra
END(__init_tlb)
