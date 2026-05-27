#as: --gsframe
#objdump: --sframe=.sframe
#name: Non SP-FP based CFA in flex FDE type
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
#?    CFA fixed FP offset: \-?\d+
#?    CFA fixed RA offset: \-?\d+
    Num FDEs: 1
    Num FREs: 8

  Function Index :

    func idx \[0\]: pc = 0x0, size = 199 bytes, attr = "F"
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+0008 +sp\+40 +u +f +
    0+0014 +r3\+40 +u +f +
    0+0073 +sp\+40 +u +f +
    0+007b +sp\-8 +u +f +
    0+007e +r3\+40 +u +f +
    0+00c2 +sp\+40 +u +f +
    0+00c6 +sp\-8 +u +f +

#pass
