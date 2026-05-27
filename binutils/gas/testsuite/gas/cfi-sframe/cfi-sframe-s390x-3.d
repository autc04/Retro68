#name: SFrame generation on s390x - .cfi_def_cfa_register with no previous offset
#as: --gsframe
#objdump: --sframe=.sframe
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 1
    Num FREs: 1

  Function Index :

    func idx \[0\]: pc = 0x0, size = 0 bytes
    STARTPC +CFA +FP +RA +
    0+0000 +fp\+160 +u +u +
#pass
