.p2align 2
bar:
  nop
.globl _start
_start:
  la.pcrel $a0, bar
  ret
.size _start, . - _start
