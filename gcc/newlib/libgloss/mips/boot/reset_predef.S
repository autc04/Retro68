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

#define _RESETCODE

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include "predef.h"

MIPS_NOMIPS16

	.set push
	MIPS_NOMICROMIPS

LEAF(__reset_vector)
	lui	k1, %hi(__cpu_init)
	addiu	k1, %lo(__cpu_init)
	mtc0	zero, C0_COUNT	  /* Clear CP0 Count (Used to measure boot time.) */
	jr	k1
	.space 32		  /* Just to cope with a quirk of MIPS malta boards */
				  /* this can be deleted for anything else */
END(__reset_vector)
	.set pop

LEAF(__cpu_init)

	/*
	 * Verify the code is here due to a reset and not NMI. If this is an NMI then trigger
	 * a debugger breakpoint using a sdbbp instruction.
	 */

	mfc0	k1, C0_STATUS
	ext	k1, k1, SR_NMI_SHIFT, 1
	beqz	k1, $Lnot_nmi
	move	k0, t9			/* Preserve t9 */
	move	k1, a0			/* Preserve a0 */
	li	t9, 15			/* UHI exception operation */
	li	a0, 0			/* Use hard register context */
	sdbbp	1			/* Invoke UHI operation */

$Lnot_nmi:

#ifndef SKIP_CORE_CHECK
	jal	__core_check
#endif

	/* Init CP0 Status, Count, Compare, Watch*, and Cause */
	jal	__init_cp0

#if !defined(HCI)

#if (defined(SLINE_ENC) && SLINE_ENC != 0) || (defined(MEM_MAPPED_L2C) && MEM_MAPPED_L2C != 0)
	/*
	 * Initialise L2/L3 cache
	 * This could be done from cached code if there is a cca override or similar
	 */
	jal	 __init_l23cache
	/* Save the L2 config register */
	move	 s0, a0
#endif

#if defined(ILINE_ENC) && ILINE_ENC != 0
	/* Initialize the L1 instruction cache */
	jal	  __init_icache
#endif

#endif /* !defined(HCI) */

	/*
	 * The changing of Kernel mode cacheability must be done from KSEG1
	 * Since the code is executing from KSEG0 it needs to do a jump to KSEG1, change K0
	 * and jump back to KSEG0.
	 */

	lui	a2, %hi(__change_k0_cca)
	addiu	a2, a2, %lo(__change_k0_cca)
	li	a1, 0xf
	ins	a2, a1, 29, 1		/* changed to KSEG1 address by setting bit 29 */
	jalr	a2

#if !defined(HCI)

#if (defined(SLINE_ENC) && SLINE_ENC != 0) || (defined(MEM_MAPPED_L2C) && MEM_MAPPED_L2C != 0)
	/* Pass in the L2 config register */
	move	a0, s0
	/* Support initialising L2 with L1 cache enabled */
	jal	__init_l23cache_cached
#endif

#if defined(DLINE_ENC) && DLINE_ENC != 0
	/* Initialize the L1 data cache */
	jal	__init_dcache
#endif

#endif /* !defined(HCI) */

#if defined(HAVE_TLB) && HAVE_TLB
	/* Initialize the TLB */
	jal	__init_tlb
#endif

	/* Allow everything else to be initialized via a hook */
	.weak __boot_init_hook
	lui	a2, %hi(__boot_init_hook)
	addiu	a2, a2, %lo(__boot_init_hook)
	beqz	a2, 1f
	jalr	a2
1:
	/* Skip copy to ram when executing in place */
	.weak __xip
	lui	a1, %hi(__xip)
	addiu	a1, a1, %lo(__xip)
	bnez	a1, $Lcopy_to_ram_done

	/* Copy code and data to RAM */
	li	s1, 0xffffffff

	/* Copy code and read-only/initialized data from FLASH to (uncached) RAM */
	lui	a1, %hi(__flash_app_start)
	addiu	a1, a1, %lo(__flash_app_start)
#if defined(ILINE_ENC) && ILINE_ENC != 0
	ins	a1, s1, 29, 1		/* Make it uncached (kseg1) */
#endif
	lui	a2, %hi(__app_start)
	addiu	a2, a2, %lo(__app_start)
#if defined(ILINE_ENC) && ILINE_ENC != 0
	ins	a2, s1, 29, 1		/* Make it uncached (kseg1) */
#endif
	lui	a3, %hi(_edata)
	addiu	a3, a3, %lo(_edata)
#if defined(ILINE_ENC) && ILINE_ENC != 0
	ins	a3, s1, 29, 1		/* Make it uncached (kseg1) */
#endif
	beq	a2, a3, $Lcopy_to_ram_done
$Lnext_ram_word:
	lw	a0, 0(a1)
	addiu	a2, a2, 4
	addiu	a1, a1, 4
	sw	a0, -4(a2)
	bne	a3, a2, $Lnext_ram_word
$Lcopy_to_ram_done:

	# Prepare for eret to _start
	lui	ra, %hi($Lall_done)	/* If main returns then go to all_done */
	addiu	ra, ra, %lo($Lall_done)
	lui	t0, %hi(_start)
	addiu	t0, t0, %lo(_start)
	mtc0	t0, C0_ERRPC		/* Set ErrorEPC to _start */
	ehb
	li	a0, 0			/* UHI compliant null argument setup */

	/* Return from exception will now execute the application startup code */
	eret

$Lall_done:
	/* Allow an exit hook to intercept the end of execution */
	.weak __boot_exit_hook
	lui	a2, %hi(__boot_exit_hook)
	addiu	a2, a2, %lo(__boot_exit_hook)
	beqz	a2, 1f
	jalr	a2
1:
	/*
	 * If _start returns it will return to this point.
	 * Just spin here reporting the exit.
	 */
	li	t9, 1			/* UHI exit operation */
	move	a0, va0			/* Collect exit code for UHI exit */
	sdbbp	1			/* Invoke UHI operation */
	b	$Lall_done

END(__cpu_init)

/**************************************************************************************
    B O O T   E X C E P T I O N   H A N D L E R S (CP0 Status[BEV] = 1)
**************************************************************************************/
/* NOTE: the linker script must insure that this code starts at start + 0x200 so the exception */
/* vectors will be addressed properly. */

/* TLB refill, 32 bit task. */
.org 0x200
LEAF(__boot_tlb_refill)
	move	k0, t9			/* Preserve t9 */
	move	k1, a0			/* Preserve a0 */
	li	t9, 15			/* UHI exception operation */
	li	a0, 0			/* Use hard register context */
	sdbbp	1			/* Invoke UHI operation */
END(__boot_tlb_refill)

/* XTLB refill, 64 bit task. */
.org 0x280
LEAF(__boot_xtlb_refill)
	move	k0, t9			/* Preserve t9 */
	move	k1, a0			/* Preserve a0 */
	li	t9, 15			/* UHI exception operation */
	li	a0, 0			/* Use hard register context */
	sdbbp	1			/* Invoke UHI operation */
END(__boot_xtlb_refill)

/* Cache error exception. */
.org 0x300
LEAF(__boot_cache_error)
	move	k0, t9			/* Preserve t9 */
	move	k1, a0			/* Preserve a0 */
	li	t9, 15			/* UHI exception operation */
	li	a0, 0			/* Use hard register context */
	sdbbp	1			/* Invoke UHI operation */
END(__boot_cache_error)

/* General exception. */
.org 0x380
LEAF(__boot_general_exception)
	move	k0, t9			/* Preserve t9 */
	move	k1, a0			/* Preserve a0 */
	li	t9, 15			/* UHI exception operation */
	li	a0, 0			/* Use hard register context */
	sdbbp	1			/* Invoke UHI operation */
END(__boot_general_exception)

# If you want the above code to fit into 1k flash you will need to leave out the
# code below. This is the code that covers the debug exception which you normally will not get.

/* EJTAG Debug */
.org 0x480 
LEAF(__boot_debug_exception)
	PTR_MFC0  k1, C0_DEPC
	PTR_MTC0  k1, C0_DESAVE
	lui       k1, %hi(1f)
	addiu     k1, %lo(1f)
	PTR_MTC0  k1, C0_DEPC
	ehb
	deret
1:	wait
	b	  1b  /* Stay here */
END(__boot_debug_exception)
