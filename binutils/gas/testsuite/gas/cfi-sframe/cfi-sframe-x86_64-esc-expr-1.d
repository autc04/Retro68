#as: --gsframe
#objdump: --sframe=.sframe
#name: DRAP pattern with r10-based CFA
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
#?    CFA fixed FP offset: \-?\d+
#?    CFA fixed RA offset: \-?\d+
    Num FDEs: 1
    Num FREs: 6

  Function Index :

    func idx \[0\]: pc = 0x0, size = 95 bytes, attr = "F"
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+0009 +r10\+0 +u +f +
    0+0018 +r10\+0 +\(fp\+0\) +U +
    0+001a +\(fp\-8\) +\(fp\+0\) +U +
    0+0052 +r10\+0 +\(fp\+0\) +U +
    0+005e +sp\+8 +\(fp\+0\) +U +
#pass
