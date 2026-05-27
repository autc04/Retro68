#as: --gsframe
#warning: \.cfi\_escape DW\_CFA\_val\_offset with FP reg 6
#objdump: --sframe=.sframe
#name: CFI_escape with register of significance to SFrame II
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
