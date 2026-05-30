    .hidden global_a
    .weak   global_b
    .text
    .align 2
main:
    # Symbols defined .hidden are bound local and
    # the linker should differenciate them.
    pcaddi    $a0, %pcrel_20(global_a)
    pcaddi    $a0, %pcrel_20(global_b)
