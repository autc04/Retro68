	.text
	.global bar
	.type bar, %function
bar:
	.cfi_startproc
	.cfi_mte_tagged_frame
        stp     x19, x20, [sp, -144]!
        .cfi_def_cfa_offset 144
        .cfi_offset 19, -144
        .cfi_offset 20, -136
        ldp     x19, x20, [sp], 144
        .cfi_restore 20
        .cfi_restore 19
        .cfi_def_cfa_offset 0
        ret
	.cfi_endproc
	.size bar, .-bar
