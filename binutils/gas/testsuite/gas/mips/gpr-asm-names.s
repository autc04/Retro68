# Source file to test GAS assembling using named GPRs for each ABI choice.

	.set noreorder
	.set noat

	.globl text_label .text
text_label:

.ifdef OLDABI

	lui	$zero, 0
	lui	$at, 0
	lui	$v0, 0
	lui	$v1, 0
	lui	$a0, 0
	lui	$a1, 0
	lui	$a2, 0
	lui	$a3, 0
	lui	$t0, 0
	lui	$t1, 0
	lui	$t2, 0
	lui	$t3, 0
	lui	$t4, 0
	lui	$t5, 0
	lui	$t6, 0
	lui	$t7, 0
	lui	$s0, 0
	lui	$s1, 0
	lui	$s2, 0
	lui	$s3, 0
	lui	$s4, 0
	lui	$s5, 0
	lui	$s6, 0
	lui	$s7, 0
	lui	$t8, 0
	lui	$t9, 0
	lui	$k0, 0
	lui	$k1, 0
	lui	$gp, 0
	lui	$sp, 0
	lui	$s8, 0
	lui	$ra, 0

.else

	lui	$zero, 0
	lui	$at, 0
	lui	$v0, 0
	lui	$v1, 0
	lui	$a0, 0
	lui	$a1, 0
	lui	$a2, 0
	lui	$a3, 0
	lui	$a4, 0
	lui	$a5, 0
	lui	$a6, 0
	lui	$a7, 0
	lui	$t0, 0
	lui	$t1, 0
	lui	$t2, 0
	lui	$t3, 0
	lui	$s0, 0
	lui	$s1, 0
	lui	$s2, 0
	lui	$s3, 0
	lui	$s4, 0
	lui	$s5, 0
	lui	$s6, 0
	lui	$s7, 0
	lui	$t8, 0
	lui	$t9, 0
	lui	$k0, 0
	lui	$k1, 0
	lui	$gp, 0
	lui	$sp, 0
	lui	$s8, 0
	lui	$ra, 0

.endif

# Force at least 8 (non-delay-slot) zero bytes, to make 'objdump' print ...
      .space  8
