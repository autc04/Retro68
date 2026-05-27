#as: --gsframe
#objdump: --sframe=.sframe
#name: DW_CFA_register RA in flex FDE type
#...

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: -8
    Num FDEs: 1
    Num FREs: 3

  Function Index :

    func idx \[0\]: pc = 0x0, size = 7 bytes, attr = "F"
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+0004 +sp\+40 +u +f +
    0+0005 +sp\+0 +u +r2\+0 +
