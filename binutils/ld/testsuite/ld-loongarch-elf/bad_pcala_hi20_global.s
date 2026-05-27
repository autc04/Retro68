    .hidden global_a
    .text
    .align 2
main:
    # Symbols defined .hidden are bound local and
    # the linker should differenciate them.
    la.pcrel  $a0, global_a
    la.pcrel  $a0, global_b
