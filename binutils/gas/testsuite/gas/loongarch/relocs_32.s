/* b16.  */
jirl	  $r4,$r5,%b16(.L1)

/* b26.  */
b	  %b26(.L1)

/* lu12i.w.  */
lu12i.w	  $r4,%abs_hi20(.L1)

/* ori   */
ori	  $r4,$r5,%abs_lo12(.L1)

pcalau12i $r4,%pc_hi20(.L1)
addi.w	  $r5,$r4,%pc_lo12(.L1)

pcalau12i $r4,%got_pc_hi20(.L1)
ld.w	  $r5,$r4,%got_pc_lo12(.L1)

lu12i.w	  $r4,%got_hi20(.L1)
ori	  $r4,$r4,%got_lo12(.L1)

/* TLS LE.  */
lu12i.w	  $r4,%le_hi20(TLSL1)
ori	  $r5,$r4,%le_lo12(TLSL1)

/* Part of IE relocs.  */
pcalau12i $r4,%ie_pc_hi20(TLSL1)
addi.d	  $r5,$r0,%ie_pc_lo12(TLSL1)

lu12i.w	  $r4,%ie_hi20(TLSL1)
ori	  $r4,$r4,%ie_lo12(TLSL1)

/* Part of LD relocs.  */
pcalau12i $r4,%ld_pc_hi20(TLSL1)
lu12i.w	  $r4,%ld_hi20(TLSL1)

/* Part of GD relocs.  */
pcalau12i $r4,%gd_pc_hi20(TLSL1)
lu12i.w	  $r4,%gd_hi20(TLSL1)

/* Test insn relocs.  */
.L1:
/* 32-bit PC relative.  */
.4byte	  .L2-.L1
.L2:
nop

/* R_LARCH_ALIGN.  */
.align	4

/* R_LARCH_PCREL20_S2.  */
pcaddi	  $r12,.L1

/* Part of DESC relocs.   */
pcalau12i $r4,%desc_pc_hi20(TLSL1)
addi.w	  $r5,$r5,%desc_pc_lo12(TLSL1)

lu12i.w	  $r4,%desc_hi20(TLSL1)
ori	  $r4,$r4,%desc_lo12(TLSL1)
ld.w	  $r1,$r4,%desc_ld(TLSL1)
jirl	  $r1,$r1,%desc_call(TLSL1)

NEW:
/* LA32S/R medium call.  */
call30	  .L1
tail30	  $r1, .L1

/* LA32R PCREL.  */
.Lpcadd_hi0:
pcaddu12i $r4, %pcadd_hi20(s)
addi.w	  $r4, $r4, %pcadd_lo12(.Lpcadd_hi0)

/* LA32R GOT.  */
.Lpcadd_hi1:
pcaddu12i $r4, %got_pcadd_hi20(s)
ld.w	  $r4, $r4, %got_pcadd_lo12(.Lpcadd_hi1)

/* LA32R TLS IE.  */
.Lpcadd_hi2:
pcaddu12i $r4, %ie_pcadd_hi20(TLSL1)
ld.w	  $r4, $r4, %ie_pcadd_lo12(.Lpcadd_hi2)

/* Part of LA32R TLS LD relocs.  */
.Lpcadd_hi3:
pcaddu12i $r4, %ld_pcadd_hi20(TLSL1)
addi.w	  $r4, $r4, %ld_pcadd_lo12(.Lpcadd_hi3)

/* Part of LA32R TLS GD relocs.  */
.Lpcadd_hi4:
pcaddu12i $r4, %gd_pcadd_hi20(TLSL1)
addi.w	  $r4, $r4, %gd_pcadd_lo12(.Lpcadd_hi4)

/* Part of LA32R TLS DESC relocs.  */
.Lpcadd_hi5:
pcaddu12i $r4, %desc_pcadd_hi20(TLS1)
addi.w	  $r4, $r4, %desc_pcadd_lo12(.Lpcadd_hi5)
ld.w	  $r1, $r4, %desc_ld(TLS1)
jirl	  $r1, $r1, %desc_call(TLS1)
