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

#include <mips/asm.h>
#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/uhi_syscalls.h>

MIPS_NOMIPS16

	.text
	.align  2
	.globl  __getargs
	.ent  __getargs
	.type __getargs, @function
__getargs:

	move	t0, zero		/* argc */
	move	t1, zero		/* argv */

	li	t9, __MIPS_UHI_ARGC
	li	vt0, __MIPS_UHI_SYSCALL_NUM

	ASM_SYSCALL (__MIPS_UHI_SYSCALL_NUM)

	/* return on error (-1) */
	blez	vt0, .Lreturn

	move	t0, vt0			/* argc: number of arguments */
	sll	t3, t0, LOG2_SZPTR	/* Multiply by size of pointer */
	addiu	t3, t3, ALSZ		/* Round to stack alignment */
	and	t3, t3, ALMASK
	PTR_SUBU  sp, sp, t3		/* make room for argv */
	move	t1, sp			/* argv */
	move	t2, zero

.Lloop:

	li	t9, __MIPS_UHI_ARGLEN
	li	vt0, __MIPS_UHI_SYSCALL_NUM
	move	a0, t2			/* argument number */

	ASM_SYSCALL (__MIPS_UHI_SYSCALL_NUM)	/* get length of arg N */

	blez	vt0, .Lreturn		/* return on error */

	addiu	vt0, vt0, 1
	addiu	vt0, vt0, ALSZ
	and	vt0, vt0, ALMASK
	PTR_SUBU sp, sp, vt0
	sll	t3, t2, LOG2_SZPTR
	PTR_ADDU t3, t3, t1
	PTR_S	sp, 0(t3)		/* argv[i] */

	li	t9, __MIPS_UHI_ARGN
	li	vt0, __MIPS_UHI_SYSCALL_NUM
	move	a0, t2			/* argument number */
	move	a1, sp			/* argument buffer */

	ASM_SYSCALL (__MIPS_UHI_SYSCALL_NUM)

	bltz	vt0, .Lreturn		/* return on error */

	addiu	t2, t2, 1
	slt	vt0, t2, t0
	bnez	vt0, .Lloop

.Lreturn:
	move	a0, t0
	move	a1, t1

	/* Leave 16-bytes for register arguments and up to 8 bytes for
	   a null envp.  Round up to 32 for alignment.  */
	PTR_SUBU sp, sp, 16+(NARGSAVE*SZARG)
	PTR_ADDU a2, sp, (NARGSAVE*SZARG)
	PTR_S	zero, 0(a2)

	jr	$31

	.end  __getargs
	.size __getargs, .-__getargs
