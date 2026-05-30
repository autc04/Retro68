#as: --gsframe
#objdump: --sframe=.sframe
#name: cfi_remember_state after cfi_startproc PR gas/33756
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
#?    CFA fixed FP offset: \-?\d+
#?    CFA fixed RA offset: \-?\d+
    Num FDEs: 1
    Num FREs: 3

  Function Index :

    func idx \[0\]: pc = 0x0, size = 16 bytes
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +[uf] +
    0+0004 +sp\+16 +u +[uf] +
    0+000c +sp\+8 +u +[uf] +

#pass
