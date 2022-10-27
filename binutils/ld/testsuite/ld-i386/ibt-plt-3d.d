#source: ibt-plt-3.s
#as: --32
#ld: -shared -m elf_i386 -z ibt --hash-style=sysv -z noseparate-code
#readelf: -wf -n

Contents of the .eh_frame section:

0+ 00000014 00000000 CIE
  Version:               1
  Augmentation:          "zR"
  Code alignment factor: 1
  Data alignment factor: -4
  Return address column: 8
  Augmentation data:     1b

  DW_CFA_def_cfa: r4 \(esp\) ofs 4
  DW_CFA_offset: r8 \(eip\) at cfa-4
  DW_CFA_nop
  DW_CFA_nop

0+18 0000001c 0000001c FDE cie=00000000 pc=000001b0..000001ce
  DW_CFA_advance_loc: 1 to 000001b1
  DW_CFA_def_cfa_offset: 8
  DW_CFA_offset: r3 \(ebx\) at cfa-8
  DW_CFA_advance_loc: 14 to 000001bf
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 13 to 000001cc
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 000001cd
  DW_CFA_restore: r3 \(ebx\)
  DW_CFA_def_cfa_offset: 4

0+38 00000010 0000003c FDE cie=00000000 pc=000001ce..000001d2
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0+4c 00000020 00000050 FDE cie=00000000 pc=00000160..00000190
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 00000166
  DW_CFA_def_cfa_offset: 12
  DW_CFA_advance_loc: 10 to 00000170
  DW_CFA_def_cfa_expression \(DW_OP_breg4 \(esp\): 4; DW_OP_breg8 \(eip\): 0; DW_OP_lit15; DW_OP_and; DW_OP_lit9; DW_OP_ge; DW_OP_lit2; DW_OP_shl; DW_OP_plus\)

0+70 00000010 00000074 FDE cie=00000000 pc=00000190..000001b0
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop


Displaying notes found in: .note.gnu.property
  Owner                 Data size	Description
  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT
