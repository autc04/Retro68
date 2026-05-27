#as: --gsframe
#warning: \.cfi\_escape with op \(0x14\)
#objdump: --sframe=.sframe
#name: CFI_escape with multiple DWARF expr
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
#?    CFA fixed FP offset: \-?\d+
#?    CFA fixed RA offset: \-?\d+
    Num FDEs: 0
    Num FREs: 0

#pass
