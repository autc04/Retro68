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

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include <mips/hal.h>

MIPS_NOMIPS16

/*
 * Used to support an alternate entry point that overlays the TLB refill
 * exception entry point.  This flag must be cleared before exceptions
 * are ready to be handled.
 */
.data
EXPORTS(__first_boot, 4)
	.word	0x1

_TEXT_SECTION

/*
 * FUNCTION:	__register_excpt_handler
 *
 * DESCRIPTION: Register __exception_entry at EBASE+0x180. Return the new
 *		value for C0_SR.
 */
WLEAF(__register_excpt_handler)
	.set	push
	.set	noat

	/* Fetch initial status */
	mfc0	a1, C0_SR

	/*
	 * Get into a clean state.
	 * Important things: base mode is kernel and ERL, ESL, IE are clear
	 * Set BEV=1 to allow changing EBASE later.
	 */
	li	t0, SR_BEV
	mtc0	t0, C0_SR
	ehb

	/*
	 * Enable use of a boot state hook
	 * a0 = Boot time RA
	 * a1 = Boot time SR
	 * a2 = Current RA. There is no stack so get the callee to pass this
	 *      back.
	 */
.weak	__register_excpt_boot
	LA	t0, __register_excpt_boot
	beqz	t0, 1f
	move	a2, ra
	jalr	t0
	move	ra, va0
1:
	/* Clear first boot flag */
	LA	t0, __first_boot
	sw	zero, 0(t0)

	mfc0	t3, C0_CONFIG3
#if defined (__mips_micromips)
	/* Set Config3.ISAOnExc for microMIPS */
	li	t0, CFG3_IOE
	or	t0, t0, t3
	mtc0	t0, C0_CONFIG3
#endif

	/* Set desired EBASE */
	LA	t0, __excpt_ebase
	/*
	 * Always set the write gate as the requested EBASE may not be in kseg0.
	 * This may or may not exist in hardware but if it doesn't then the
	 * ebase address will simply get masked with inevitable consequences.
	 */
	ori	t0, t0, EBASE_WG
	PTR_MTC0 t0, C0_EBASE
	ehb

	/* Set up new empty status value */
	move	va0, zero

	/* Set up vector spacing */
	LA	t0, __isr_vec_space

	/* Check for vectored interrupt support */
	andi	t1, t3, CFG3_VI | CFG3_VEIC
	/* Skip vector spacing setup if neither VINT nor VEIC is present */
	beqz	t1, 1f

	/* Set vector spacing */
	mfc0	t1, C0_INTCTL
	srl	t0, t0, 5
	ins	t1, t0, INTCTL_VS_SHIFT, INTCTL_VS_BITS
	mtc0	t1, C0_INTCTL
	b	2f
1:
	/*
	 * Check non-zero vector spacing without vectored interrupt support.
	 * If so, do not enable interrupts.
	 */
	bnez	t0, 3f
2:
	/* Turn on use of the special exception vector and enable interrupts */
	li	t0, CR_IV
	mtc0	t0, C0_CAUSE
	ehb

	/* Check for VEIC and do not enable interrupts if EIC is active */
	ext     t0, t3, CFG3_VEIC_SHIFT, 1
	bnez	t0, 3f

	/* Enable interrupts in the new status value */
	ori	va0, va0, SR_IE
3:
	jr	ra

	.set	pop
WEND(__register_excpt_handler)
