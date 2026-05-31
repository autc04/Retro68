# Source file to test GAS assembling using named FPRs for each ABI choice.

	.set noreorder
	.set noat

	# MIPS_SIM must be set on the command line to one of these.
	.set ABI_32,	 1
	.set ABI_O64,	 2
	.set ABI_N32,	 3
	.set ABI_64,	 4
	.set ABI_EABI32, 5
	.set ABI_EABI64, 6

	.globl text_label .text
text_label:

.if (MIPS_SIM == ABI_32)

	mtc1	$0, $fv0
	mtc1	$0, $fv0f
	mtc1	$0, $fv1
	mtc1	$0, $fv1f
	mtc1	$0, $ft0
	mtc1	$0, $ft0f
	mtc1	$0, $ft1
	mtc1	$0, $ft1f
	mtc1	$0, $ft2
	mtc1	$0, $ft2f
	mtc1	$0, $ft3
	mtc1	$0, $ft3f
	mtc1	$0, $fa0
	mtc1	$0, $fa0f
	mtc1	$0, $fa1
	mtc1	$0, $fa1f
	mtc1	$0, $ft4
	mtc1	$0, $ft4f
	mtc1	$0, $ft5
	mtc1	$0, $ft5f
	mtc1	$0, $fs0
	mtc1	$0, $fs0f
	mtc1	$0, $fs1
	mtc1	$0, $fs1f
	mtc1	$0, $fs2
	mtc1	$0, $fs2f
	mtc1	$0, $fs3
	mtc1	$0, $fs3f
	mtc1	$0, $fs4
	mtc1	$0, $fs4f
	mtc1	$0, $fs5
	mtc1	$0, $fs5f

.elseif (MIPS_SIM == ABI_O64)

	mtc1	$0, $fv0
	mtc1	$0, $fv1
	mtc1	$0, $ft0
	mtc1	$0, $ft1
	mtc1	$0, $ft2
	mtc1	$0, $ft3
	mtc1	$0, $ft4
	mtc1	$0, $ft5
	mtc1	$0, $ft6
	mtc1	$0, $ft7
	mtc1	$0, $ft8
	mtc1	$0, $ft9
	mtc1	$0, $fa0
	mtc1	$0, $fa1
	mtc1	$0, $ft10
	mtc1	$0, $ft11
	mtc1	$0, $ft12
	mtc1	$0, $ft13
	mtc1	$0, $ft14
	mtc1	$0, $ft15
	mtc1	$0, $fs0
	mtc1	$0, $fs1
	mtc1	$0, $fs2
	mtc1	$0, $fs3
	mtc1	$0, $fs4
	mtc1	$0, $fs5
	mtc1	$0, $fs6
	mtc1	$0, $fs7
	mtc1	$0, $fs8
	mtc1	$0, $fs9
	mtc1	$0, $fs10
	mtc1	$0, $fs11

.elseif (MIPS_SIM == ABI_N32)

	mtc1	$0, $fv0
	mtc1	$0, $ft14
	mtc1	$0, $fv1
	mtc1	$0, $ft15
	mtc1	$0, $ft0
	mtc1	$0, $ft1
	mtc1	$0, $ft2
	mtc1	$0, $ft3
	mtc1	$0, $ft4
	mtc1	$0, $ft5
	mtc1	$0, $ft6
	mtc1	$0, $ft7
	mtc1	$0, $fa0
	mtc1	$0, $fa1
	mtc1	$0, $fa2
	mtc1	$0, $fa3
	mtc1	$0, $fa4
	mtc1	$0, $fa5
	mtc1	$0, $fa6
	mtc1	$0, $fa7
	mtc1	$0, $fs0
	mtc1	$0, $ft8
	mtc1	$0, $fs1
	mtc1	$0, $ft9
	mtc1	$0, $fs2
	mtc1	$0, $ft10
	mtc1	$0, $fs3
	mtc1	$0, $ft11
	mtc1	$0, $fs4
	mtc1	$0, $ft12
	mtc1	$0, $fs5
	mtc1	$0, $ft13

.elseif (MIPS_SIM == ABI_64)

	mtc1	$0, $fv0
	mtc1	$0, $ft12
	mtc1	$0, $fv1
	mtc1	$0, $ft13
	mtc1	$0, $ft0
	mtc1	$0, $ft1
	mtc1	$0, $ft2
	mtc1	$0, $ft3
	mtc1	$0, $ft4
	mtc1	$0, $ft5
	mtc1	$0, $ft6
	mtc1	$0, $ft7
	mtc1	$0, $fa0
	mtc1	$0, $fa1
	mtc1	$0, $fa2
	mtc1	$0, $fa3
	mtc1	$0, $fa4
	mtc1	$0, $fa5
	mtc1	$0, $fa6
	mtc1	$0, $fa7
	mtc1	$0, $ft8
	mtc1	$0, $ft9
	mtc1	$0, $ft10
	mtc1	$0, $ft11
	mtc1	$0, $fs0
	mtc1	$0, $fs1
	mtc1	$0, $fs2
	mtc1	$0, $fs3
	mtc1	$0, $fs4
	mtc1	$0, $fs5
	mtc1	$0, $fs6
	mtc1	$0, $fs7

.elseif (MIPS_SIM == ABI_EABI32)

	mtc1	$0, $fv0
	mtc1	$0, $fv0f
	mtc1	$0, $fv1
	mtc1	$0, $fv1f
	mtc1	$0, $ft0
	mtc1	$0, $ft0f
	mtc1	$0, $ft1
	mtc1	$0, $ft1f
	mtc1	$0, $ft2
	mtc1	$0, $ft2f
	mtc1	$0, $ft3
	mtc1	$0, $ft3f
	mtc1	$0, $fa0
	mtc1	$0, $fa0f
	mtc1	$0, $fa1
	mtc1	$0, $fa1f
	mtc1	$0, $fa2
	mtc1	$0, $fa2f
	mtc1	$0, $fa3
	mtc1	$0, $fa3f
	mtc1	$0, $fs0
	mtc1	$0, $fs0f
	mtc1	$0, $fs1
	mtc1	$0, $fs1f
	mtc1	$0, $fs2
	mtc1	$0, $fs2f
	mtc1	$0, $fs3
	mtc1	$0, $fs3f
	mtc1	$0, $fs4
	mtc1	$0, $fs4f
	mtc1	$0, $fs5
	mtc1	$0, $fs5f

.elseif (MIPS_SIM == ABI_EABI64)

	mtc1	$0, $fv0
	mtc1	$0, $fv1
	mtc1	$0, $ft0
	mtc1	$0, $ft1
	mtc1	$0, $ft2
	mtc1	$0, $ft3
	mtc1	$0, $ft4
	mtc1	$0, $ft5
	mtc1	$0, $ft6
	mtc1	$0, $ft7
	mtc1	$0, $ft8
	mtc1	$0, $ft9
	mtc1	$0, $fa0
	mtc1	$0, $fa1
	mtc1	$0, $fa2
	mtc1	$0, $fa3
	mtc1	$0, $fa4
	mtc1	$0, $fa5
	mtc1	$0, $fa6
	mtc1	$0, $fa7
	mtc1	$0, $fs0
	mtc1	$0, $fs1
	mtc1	$0, $fs2
	mtc1	$0, $fs3
	mtc1	$0, $fs4
	mtc1	$0, $fs5
	mtc1	$0, $fs6
	mtc1	$0, $fs7
	mtc1	$0, $fs8
	mtc1	$0, $fs9
	mtc1	$0, $fs10
	mtc1	$0, $fs11

.else

	.error "MIPS_SIM unset or bad value"

.endif

# Force at least 8 (non-delay-slot) zero bytes, to make 'objdump' print ...
      .space  8
