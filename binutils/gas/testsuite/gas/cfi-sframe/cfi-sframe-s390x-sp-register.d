#name: SFrame generation on s390x - .cfi_register with SP
#as: --gsframe
#objdump: --sframe=.sframe
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 1
    Num FREs: 3

  Function Index :

    func idx \[0\]: pc = 0x0, size = 16 bytes
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+160 +u +u +
    0+000a +sp\+320 +u +u +
    0+000e +sp\+160 +u +u +
#pass
