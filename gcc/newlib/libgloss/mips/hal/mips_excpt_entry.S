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
#include <mips/cpu.h>
#include <mips/asm.h>
#include <mips/hal.h>
#include <mips/ctx.S>

MIPS_NOMIPS16

/* Stack adjustment for ABI parameter area.  */
#define ADJ (NARGSAVE * SZARG)
/*
 * Round the context size up to a 16-byte boundary which is the maximum
 * stack alignment required for any supported ABI.
 */
#define CTX_SIZEROUND ((CTX_SIZE + ALSZ) & ALMASK)

/*
 * Exception entry points.  These are designed for use at EBASE when
 * STATUS.BEV is clear.
 * The entry points will either chain on to a user-supplied function
 * or loop indefinitely.
 */

LEAF(__exception_entry)
	.set	push
	.set	noat
.weak   _mips_tlb_refill
	_mips_tlb_refill = __exception_save
__tlb_refill_loop:
	/*
	 * Support an alternative entry point at the start of the exception
	 * vector.  Since the exception vector is normally placed first
	 * in the link map this allows a user to start execution from the
	 * same address that an executable is loaded to.
	 */
	LA	k1, __first_boot
	lw	k1, 0(k1)
	beqz	k1, 1f
	/*
	 * The start code is responsible for clearing __first_boot prior
	 * to installing the exception handlers.
	 */
	LA	k1, _start
	jr	k1
1:
	/* Support the case where no handler is defined.  */
	LA	k1, _mips_tlb_refill
	beqz	k1, __tlb_refill_loop
	jr	k1

	.org 0x80
.weak   _mips_xtlb_refill
	_mips_xtlb_refill = __exception_save
__xtlb_refill_loop:
	LA	k1, _mips_xtlb_refill
	beqz	k1, __xtlb_refill_loop
	jr	k1

	.org 0x100
.weak   _mips_cache_error
__cache_error_loop:
	LA	k1, _mips_cache_error
	beqz	k1, __cache_error_loop
	jr	k1

	.org 0x180
.weak   _mips_general_exception
__general_exception_loop:
	/*
	 * Free up k1, defering sp adjustment until later.  Preserving k1
	 * may be undesirable if an exception occurs due to a corrupt
	 * stack but since the default handlers use the user-stack to
	 * store the context then there is nothing to lose.
	 */
	REG_S	k1, (-CTX_SIZEROUND + CTX_K1)(sp)

	LA	k1, _mips_general_exception
	beqz	k1, __general_exception_loop
	jr	k1
	.set    pop
END(__exception_entry)

/*
 * FUNCTION:	__exception_save
 *
 * DESCRIPTION:	Saves the GP context to the stack and invokes
 *		_mips_handle_exception with appropriate arguments.
*/
ANESTED(__exception_save, _mips_general_exception, CTX_SIZEROUND + ADJ, zero)
	.globl  __exception_save;
	.set	push
	.set	noat

	/* Create pointer to gp_ctx.  */
	PTR_ADDU k1, sp, -CTX_SIZEROUND

	/* Save context.  */
	_gpctx_save
	/* va0 now holds C0_STATUS.  */

	/* Finish storing the rest of the CP0 registers.  */
	PTR_MFC0 t0, C0_BADVADDR
	REG_S	t0, CTX_BADVADDR(k1)

#if __mips_isa_rev < 6
	move	t0, zero
	move	t1, zero
	mfc0	t2, C0_CONFIG3
	ext	t3, t2, CFG3_BP_SHIFT, 1
	beqz	t3, 1f
#else
	/* MIPSR6 guarantees all CP0 regs are defined to at
	   least return zero.  */
#endif
	mfc0	t0, C0_BADPINSTR
#if __mips_isa_rev < 6
1:
	ext	t2, t2, CFG3_BI_SHIFT, 1
	beqz	t2, 1f
#endif
	mfc0	t1, C0_BADINSTR
1:
	sw	t0, CTX_BADPINSTR(k1)
	sw	t1, CTX_BADINSTR(k1)

	/* Get and store the exception cause.  */
	mfc0	t0, C0_CR
	sw	t0, CTX_CAUSE(k1)

	/* Extract the cause code for argument 1.  */
	ext	a1, t0, CR_X_SHIFT, CR_X_BITS

	/* Create the argument space.  */
	addiu	sp, k1, -ADJ

	/* Clear EXL.  Exceptions can now nest.  */
	ins	va0, zero, SR_EXL_SHIFT, 1
	mtc0	va0, C0_SR

	/* Move the gp_ctx pointer for argument 0.  */
	addiu	a0, sp, ADJ

	/* Manually set up the return address to restore the context below.  */
	LA	ra, __exception_restore

	/* Call the handler, indirect through t9 albeit not for any specific
	   reason.  */
	LA	t9, _mips_handle_exception
	jr	t9

	.set pop
END(__exception_save)

/*
 * FUNCTION:	__exception_restore
 *
 * DESCRIPTION:  Load the GP context from immediately above the stack
 *		 pointer and eret.
 */
LEAF(__exception_restore)
	.set	push
	.set	noat

	/* Skip past the argument save area and fall through.  */
	addiu	a0, sp, ADJ

/*
 * FUNCTION:	__gpctx_load_eret
 *
 * DESCRIPTION:  Load the GP context from the address in register a0
 *		 and eret.
 */
AENT(__gpctx_load_eret)

	_gpctx_load

	/* Return from exception.  */
	eret
	.set	pop
END(__exception_restore)
