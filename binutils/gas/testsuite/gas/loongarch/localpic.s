.text
foo:
  .quad 0
  # 32-bit PC-relative
  pcalau12i $a0,%got_pc_hi20(sym)
  ld.d	    $a0,$a0,%got_pc_lo12(sym)
  # 64-bit PC-relative
  pcalau12i $a0,%got_pc_hi20(foo)
  addi.d    $a1,$zero,%got_pc_lo12(foo)
  lu32i.d   $a1,%got64_pc_lo20(foo)
  lu52i.d   $a1,$a1,%got64_pc_hi12(foo)
  ldx.d	    $a0,$a0,$a1

  # 32-bit absolute
  lu12i.w   $a0,%got_hi20(foo)
  ori	    $a0,$a0,%got_lo12(foo)
  ld.w	    $a0,$a0,0

  #64-bit absolute
  lu12i.w   $a0,%got_hi20(sym)
  ori	    $a0,$a0,%got_lo12(sym)
  lu32i.d   $a0,%got64_lo20(sym)
  lu52i.d   $a0,$a0,%got64_hi12(sym)
  ld.d	    $a0,$a0,0

.set sym,0xabba
