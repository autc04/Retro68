#as: --gsframe
#warning: \.cfi_def_cfa_offset without CFA base register in effect
#objdump: --sframe=.sframe
#name: SFrame supports only FP/SP based CFA
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
