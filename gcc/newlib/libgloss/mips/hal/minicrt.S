#include <mips/asm.h>
#include <mips/m32c0.h>
#include <mips/regdef.h>

LEAF(_start)
#ifdef __mips_dsp
	mfc0    t0, C0_STATUS
	or      t0, t0, SR_MX
	mtc0    t0, C0_STATUS
#endif
	/* Preserve return address */
	move s0, ra
	/* Set up global pointer for small data access */
	LA gp, _gp
	/* Set up stack pointer */
	LA sp, __stack
	/* Zero the BSS */
	LA t0, _fbss
	LA t1, _end
	beq t0,t1,2f
1:
	addiu t0,t0,4
	sw zero,-4(t0)
	bne t0,t1,1b
2:
	/* Set arguments to be null for main */
	li a0, 0

	/* Reserve the ABI required argument area */
	addiu sp, sp, -(NARGSAVE * SZARG)
	/* Jump to C code */
	jal main
	/* Call the exit handler */
	move a0, va0
	jal __exit
	/* Return to boot */
	move ra, s0
	.weak __exit
AENT(__exit)
	jr ra
END(_start)
