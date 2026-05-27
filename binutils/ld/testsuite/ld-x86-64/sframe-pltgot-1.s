        .text
        .globl foo
        .type foo, @function
foo:
        .cfi_startproc
        call    func1@plt
        movq    func1@GOTPCREL(%rip), %rax
        call    func2@plt
        movq    func2@GOTPCREL(%rip), %rax
        call    func3@plt
        movq    func3@GOTPCREL(%rip), %rax
        call    func4@plt
        movq    func4@GOTPCREL(%rip), %rax
        .cfi_endproc
	.section	.note.GNU-stack,"",@progbits
