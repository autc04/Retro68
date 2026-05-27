# 0x0 pre-relax, 0x400 post-relax
# all addresses are additionally offset by 0x120000000 without `ld -shared`
before:
    la.pcrel $t0, target  # too far; should stay as pcalau12i + addi.d
    la.pcrel $t0, target  # furthest reach of relax pass 2

# 0x10 pre-relax, 0x410 post-relax
.rept 508
.word 0
.endr

# 0x800 {pre,post}-relax
# 255 nops + R_LARCH_ALIGN before relaxation
# none of the aligning nops should remain after relax pass 1
.p2align 10

# 0xbfc pre-relax, 0xc00 post-relax
    la.pcrel $t0, target  # should become single pcaddi in relax pass 0

# 0xc04 {pre,post}-relax
.rept 523775
.word 0
.endr

# 0x200400 {pre,post}-relax
target:
    break 0

# 0x200404 {pre,post}-relax
after:
.rept 523774
.word 0
.endr

# 0x3ffbfc {pre,post}-relax
    la.pcrel $t0, target  # should become single pcaddi in relax pass 0

# 255 nops + R_LARCH_ALIGN before relaxation
# none of the aligning nops should remain after relax pass 1
.p2align 10

# 0x400000 pre-relax, 0x3ffc00 post-relax
.rept 512
.word 0
.endr

# 0x400800 pre-relax, 0x400400 post-relax
    la.pcrel $t0, target  # furthest reach of relax pass 2
    la.pcrel $t0, target  # too far; should stay as pcalau12i + addi.d
