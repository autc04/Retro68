#PROG:objcopy
#name: readelf dump SFrame section .sframe2
#source: sframe-func.s
#as: --gsframe
#objcopy: --rename-section .sframe=.sframe2
#readelf: --sframe=.sframe2
#target: x86_64-*-*
#xfail: ![gas_sframe_check]

#...
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: -8
    Num FDEs: 1
    Num FREs: 4
#pass
