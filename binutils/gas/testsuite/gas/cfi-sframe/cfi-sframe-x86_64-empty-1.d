#as: --gsframe
#warning: \.cfi_escape DW\_CFA\_expression with SP reg 7
#objdump: --sframe=.sframe
#name: CFI_escape with register of significance to SFrame
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
