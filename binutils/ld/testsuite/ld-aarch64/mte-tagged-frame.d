#source: mte-tagged-frame-foo.s
#source: mte-tagged-frame-bar.s
#ld: -shared
#objdump: -Wf
#name: MTE tagged EH Frame FDE

#...
Contents of the .eh_frame section:

00000000 0000000000000010 00000000 CIE
  Version:               1
  Augmentation:          "zR"
  Code alignment factor: 4
  Data alignment factor: -8
  Return address column: 30
  Augmentation data:     1b
  DW_CFA_def_cfa: r31 \(sp\) ofs 0

00000014 0000000000000020 00000018 FDE cie=00000000 pc=[a-f0-9]+\.\.[a-f0-9]+
#...

00000038 0000000000000014 00000000 CIE
  Version:               1
  Augmentation:          "zRG"
  Code alignment factor: 4
  Data alignment factor: -8
  Return address column: 30
  Augmentation data:     1b
  DW_CFA_def_cfa: r31 \(sp\) ofs 0
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000050 000000000000001c 0000001c FDE cie=00000038 pc=[a-f0-9]+\.\.[a-f0-9]+
#...
