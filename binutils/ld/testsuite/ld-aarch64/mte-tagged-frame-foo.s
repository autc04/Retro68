	.text
	.global foo
	.type foo, %function
foo:
	.cfi_startproc
        stp     x19, x20, [sp, -32]!
        .cfi_def_cfa_offset 32
        .cfi_offset 19, -32
        .cfi_offset 20, -16
        ldp     x19, x20, [sp], 32
        .cfi_restore 20
        .cfi_restore 19
        .cfi_def_cfa_offset 0
        ret
	.cfi_endproc
	.size foo, .-foo
