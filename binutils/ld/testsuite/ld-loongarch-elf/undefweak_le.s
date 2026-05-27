_start:
	lu12i.w	$t0,%le_hi20_r(undefweak_le)
	add.d	$t0,$t0,$tp,%le_add_r(undefweak_le)
	ld.d	$t0,$t0,%le_lo12_r(undefweak_le)

	.weak	undefweak_le
	.hidden	undefweak_le
