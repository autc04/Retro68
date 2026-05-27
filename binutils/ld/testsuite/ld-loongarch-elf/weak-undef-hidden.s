.weak undef
.hidden undef

.globl _start
_start:
  la.pcrel $a0, $a1, undef + 0xaaabbbbbcccccddd
  pcaddi   $a2, undef + 0x7ff
  pcaddi   $a3, undef - 0x800
  ret
