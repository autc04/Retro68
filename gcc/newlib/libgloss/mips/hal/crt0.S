/*
 * crt0.S -- startup file for MIPS.
 *
 * Copyright (c) 1995, 1996, 1997, 2001 Cygnus Support
 * Copyright (C) 2016-2018 MIPS Tech, LLC
 *
 * The authors hereby grant permission to use, copy, modify, distribute,
 * and license this software and its documentation for any purpose, provided
 * that existing copyright notices are retained in all copies and that this
 * notice is included verbatim in any distributions. No written agreement,
 * license, or royalty fee is required for any of the authorized uses.
 * Modifications to this software may be copyrighted by their authors
 * and need not follow the licensing terms described here, provided that
 * the new terms are clearly indicated on the first page of each file where
 * they apply.
 */

/* This file does not use any floating-point ABI.  */
	.gnu_attribute 4,0

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include "abiflags.S"

MIPS_NOMIPS16

#define STARTUP_STACK_SIZE	0x40	  /* Temporary stack size to run C code */

	.section .startdata, "aw", @nobits
	.balign 16
	.space	STARTUP_STACK_SIZE
__lstack: # Points to the end of the stack
__ram_extent:
	.space 8

	.data

	.balign	SZREG
__temp_space:	   /* Temporary space to save arguments */
	.space	SZREG * 3

	.text
	.align	2

/*
 * Without the following nop, GDB thinks _start is a data variable.
 * This is probably a bug in GDB in handling a symbol that is at the
 * start of the .text section.
 */
	nop

	.globl	hardware_hazard_hook .text
	.globl	_start
	.ent	_start
_start:
#if __mips<3
#  define STATUS_MASK (SR_CU1|SR_PE)
#else
/* Post-mips2 has no SR_PE bit.  */
#  ifdef __mips64
/* Turn on 64-bit addressing and additional float regs.  */
#    define STATUS_MASK (SR_CU1|SR_FR|SR_KX|SR_SX|SR_UX)
#  else
#    if __mips_fpr==32
#      define STATUS_MASK (SR_CU1)
#    else
/* Turn on additional float regs.  */
#      define STATUS_MASK (SR_CU1|SR_FR)
#    endif
#  endif
#endif

	/* Save argument registers */
	LA	t0, __temp_space
	REG_S	a0, (SZREG * 0)(t0)
	REG_S	a1, (SZREG * 1)(t0)
	REG_S	a2, (SZREG * 2)(t0)

	/* 
	 * Save k0, k1, ra and sp and register
	 * default exception handler.
	*/
	.weak	__register_excpt_handler
	LA	t9, __register_excpt_handler
	beqz	t9, 1f
	move	a0, ra		/* save ra */
	jalr	t9
	b	2f
1:
	/* Clear Cause register.  */
	mtc0	zero,C0_CAUSE
	move	va0,zero			/* Mask for C0_SR.  */
2:
	/* Read MIPS_abiflags structure and set status/config registers
	   accordingly.  */
	.weak	__MIPS_abiflags_start
	.weak	__MIPS_abiflags_end
	LA	t0,__MIPS_abiflags_start
	LA	t1,__MIPS_abiflags_end
	PTR_ADDU t1,t1,-24

	/* Branch to 1f is the .MIPS.abiflags section is not 24 bytes.  This
	   indicates it is either missing or corrupt.  */
	bne	t0,t1,1f

	/* Check isa_level.  */
	lbu	t1,ABIFlags_isa_level(t0)
	sltu	t2,t1,3			/* Is MIPS < 3?  */
	xori	t1,t1,64		/* Is MIPS64?  */
	beq	t2,zero,3f
	li	t2,SR_PE
	or	va0,va0,t2		/* Enable soft reset.  */
3:
	li	t2,(SR_KX|SR_SX|SR_UX)
	bne	t1,zero,3f
	or	va0,va0,t2		/* Enable extended addressing.  */
3:
	/* Check DSP,DSP2,MDMX ase. */
	lw      t1,ABIFlags_ases(t0)
	andi    t1,t1,(AFL_ASE_DSP|AFL_ASE_DSPR2|AFL_ASE_MDMX)
	li	t2,SR_MX
	beq	t1,zero,3f
	or	va0,va0,t2
3:
	/* Check fp_abi.  */
	lbu	t1,ABIFlags_fp_abi(t0)
	xori	t1,t1,Val_GNU_MIPS_ABI_FP_SOFT
	li	t2,SR_CU1
	beq	t1,zero,2f		/* Skip MSA and cpr1_size checks.  */
	or	va0,va0,t2		/* Enable co-processor 1.  */

	/* Check cpr1_size.  */
	lbu	t1,ABIFlags_cpr1_size(t0)
	xori	t1,t1,AFL_REG_64
	li	t2,SR_FR
	bne	t1,zero,3f
	or	va0,va0,t2		/* Enable 64-bit FPU registers.  */
3:
	/* Check MSA ASE.  */
	lw	t1,ABIFlags_ases(t0)
	andi	t1,t1,AFL_ASE_MSA
	li	t2,SR_FR
	beq	t1,zero,2f
	or	va0,va0,t2		/* Enable 64-bit FPU registers.  */
	li	t2,CFG5_MSAEN
	mtc0	t2,C0_CONFIG,5		/* Enable MSA.  */
	b	2f

1:
	/* MIPS_abiflags structure is not available.  Set status/config
	   registers based on flags defined by compiler.  */
#ifdef __mips_soft_float
	li	va0,(STATUS_MASK-(STATUS_MASK & SR_CU1))
#else
	li	va0,STATUS_MASK
#endif

2:
	/* Set C0_SR,  */
	mtc0	va0,C0_SR
	ehb

	/* set the global data pointer */
	LA	gp, _gp
	.end _start

/*
 * zero out the bss section.
 */
	.globl	_get_ram_info .text
	.globl	__stack
	.globl	__global
	.ent	zerobss
zerobss:
	LA	t0, _fbss
	LA	t1, _end
	beq	t0,t1,1f
2:
	PTR_ADDU t0,t0,4
	sw	zero,-4(t0)
	bne	t0,t1,2b
1:
	/* setup the stack pointer */
	LA	t0, __stack			/* is __stack set? */
	bne	t0,zero,1f

	LA	sp, __lstack			/* make a small stack so we can */
						/* run some C code */
	li	a0,0				/* no need for the ram base */
	LA	a1, __ram_extent		/* storage for the extent of ram */
	jal	_get_ram_range

	/* NOTE: a0[0] contains the last address+1 of memory. */
	LA	a0, __ram_extent
	PTR_L	t0,0(a0)			/* the extent of ram */
	lw	$0,-4(t0)			/* check for valid memory */
	/* Allocate 32 bytes for the register parameters.  Allocate 16
	   bytes for a null argv and envp.  Round the result up to 64
	   bytes to preserve alignment.  */
1:
	PTR_ADDU t0,t0,-64
	move	sp,t0				/* set stack pointer */
	.end	zerobss

/*
 * initialize target specific stuff. Only execute these
 * functions it they exist.
 */
	.globl	hardware_init_hook .text
	.globl	software_init_hook .text
	.type	_fini,@function
	.type	_init,@function
	.globl	atexit .text
	.globl	exit .text
	.ent	init
init:
	/* Init the hardware if needed */
	LA	t9, hardware_init_hook
	beq	t9,zero,1f
	jalr	t9
1:
	/* Init the software if needed */
	LA	t9, software_init_hook
	beq	t9,zero,1f
	jalr	t9
1:
#ifdef _LITE_EXIT
	# Make reference to atexit weak to avoid unconditionally pulling in
	# support code.  Refer to comments in __atexit.c for more details.
	.weak	atexit
	LA	t9, atexit
	beq	t9,zero,.Lweak_atexit
	.weak	_fini
#endif
	/* Register exit handlers */
	LA	a0, _fini
	jal	atexit

#ifdef _LITE_EXIT
.Lweak_atexit:
#endif
	/* run global constructors */
	jal	_init

	/* Restore argument registers */
	LA	t0, __temp_space
	REG_L	a0,(SZREG * 0)(t0)
	REG_L	a1,(SZREG * 1)(t0)
	REG_L	a2,(SZREG * 2)(t0)

	/* Convert pointers potentially */
	.weak	__convert_argv_pointers
	LA	t0, __convert_argv_pointers
	beqz	t0, 1f
	jalr	t0
1:
	/* if a0 > 0 then we have arguments ready in a0 to a2 registers */
	bgtz	a0,.Lmain
	/* if a0 == 0 then no arguments have been set up */
	beqz	a0, 1f
	/* if a0 < -1 then we have undefined behaviour so assume no
	   arguments have been set up */
	addiu	t0, a0, 1
	bltz	t0, 1f

	/* a0 == -1 */
	.weak	__getargs
	LA	t0, __getargs
	beqz	t0, 1f
	jalr	t0				/* get arguments */
	b	.Lmain
1:
	/* no arguments */
	move	a0,zero				/* set argc to 0 */
	PTR_ADDU a1,sp,32			/* argv = sp + 32 */
	PTR_ADDU a2,sp,40			/* envp = sp + 40 */
	REG_S	zero,(a1)			/* argv[argc] = 0 */
	REG_S	zero,(a2)			/* envp[0] = 0 */

.Lmain:
	jal	main				/* call the program start function */
	move	a0,va0				/* pass through the exit code */
	jal	exit				/* call libc exit to run the G++ */
						/* destructors */
	.end	init

/*
 * _exit -- Exit from the application. Normally we cause a user trap
 *          to return to the ROM monitor for another run. NOTE: This is
 *	    the only other routine we provide in the crt0.o object, since
 *          it may be tied to the "_start" routine. It also allows
 *          executables that contain a complete world to be linked with
 *          just the crt0.o object.
 */
	.globl	hardware_exit_hook .text
	.globl	_exit
	.ent _exit
_exit:
1:
	/* Save exit code */
	LA	t0, __temp_space
	REG_S	a0,0(t0)

	LA	t0, hardware_exit_hook
	beq	t0,zero,2f
	jalr	t0
2:

	/* Restore return value from main */
	LA	t0, __temp_space
	REG_L	a0,0(t0)

	.global __exit .text
	jal	__exit

	/* The BREAK instruction can cope with 0xfffff, but GAS limits the
	   range */
	break	1023
	b	1b				# but loop back just in-case
	.end _exit
 
/* EOF crt0.S */
