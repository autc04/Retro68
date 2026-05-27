#as: --gsframe
#warning: SP register 7 in \.cfi\_register
#objdump: --sframe=.sframe
#name: SP register 7 in .cfi_register
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
