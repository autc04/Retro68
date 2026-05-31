#as: --gsframe
#objdump: --sframe=.sframe
#name: Flex FDE with RA state transition
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
#?    CFA fixed FP offset: \-?\d+
#?    CFA fixed RA offset: \-?\d+
    Num FDEs: 1
    Num FREs: 5

  Function Index :

    func idx \[0\]: pc = 0x0, size = 17 bytes, attr = "F"
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+0004 +sp\+40 +u +f +
    0+0008 +sp\+40 +\(fp\+48\) +U +
    0+000c +sp\+40 +r3\+0 +U +
    0+0010 +sp\+8 +c\+16 +U +

#pass
