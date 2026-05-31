#name: SFrame generation on s390x - non-default RA register
#as: --gsframe
#warning: non-default RA register 7
#objdump: --sframe=.sframe
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 0
    Num FREs: 0

#pass
