#as: --gsframe
#warning: SP reg 7 in \.cfi\_undefined
#objdump: --sframe=.sframe
#name: DW_CFA_undefined with register SP
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
