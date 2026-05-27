.option pic
.option norvc

.global sym_abs_before
.set sym_abs_before, 42

.text
.global _start
_start:
# Need defer expression
la  x1, sym_abs_before
lga x2, sym_abs_before
.L1: auipc x3, %got_pcrel_hi (sym_abs_before)
     addi  x3, x3, %pcrel_lo (.L1)
# This is fine
la  x4, sym_abs_after
lga x5, sym_abs_after
.L2: auipc x6, %got_pcrel_hi (sym_abs_after)
     addi  x6, x6, %pcrel_lo (.L2)

.global sym_abs_after
.set sym_abs_after, 42
