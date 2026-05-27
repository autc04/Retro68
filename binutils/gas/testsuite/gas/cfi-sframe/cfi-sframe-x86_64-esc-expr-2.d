#as: --gsframe
#objdump: --sframe=.sframe
#name: DRAP pattern with sleb128
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
#?    CFA fixed FP offset: \-?\d+
#?    CFA fixed RA offset: \-?\d+
    Num FDEs: 1
    Num FREs: 4

  Function Index :

    func idx \[0\]: pc = 0x0, size = 15 bytes, attr = "F"
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+0004 +sp\+40 +u +f +
    0+0008 +\(fp-48\) +u +f +
    0+000b +sp\+8 +u +f +
#pass
