bar:
  nop
.p2align 6

.reloc ., R_LARCH_ALIGN, 60
.rept 15
  1: nop
.endr
  la.pcrel $a0, bar
  ret

.reloc ., R_LARCH_ALIGN, 60
.rept 15
  2: nop
.endr

.globl _start
.set _start, 1b
.size _start, 2b - 1b
