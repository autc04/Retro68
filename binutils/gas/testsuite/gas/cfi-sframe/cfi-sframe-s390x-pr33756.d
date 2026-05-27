#as: --gsframe
#objdump: --sframe=.sframe
#name: SFrame generation on s390x - .cfi_remember_state after .cfi_startproc PR gas/33756
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 1
    Num FREs: 4

  Function Index :

    func idx \[0\]: pc = 0x0, size = 20 bytes
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+160 +u +u +
    0+0006 +sp\+160 +c-72 +c-48 +
    0+000c +sp\+320 +c-72 +c-48 +
    0+0012 +sp\+160 +u +u +

#pass
