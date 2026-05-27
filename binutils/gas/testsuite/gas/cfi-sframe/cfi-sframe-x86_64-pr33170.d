#as: --gsframe
#objdump: --sframe=.sframe
#name: SFrame generation on x86_64 pr31170
#...
Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: \-8
    Num FDEs: 1
    Num FREs: 2

  Function Index :

    func idx \[0\]: pc = 0x0, size = 50 bytes
    STARTPC +CFA +FP +RA +
    0+0000 +fp\+16 +c\-16 +f +
    0+002d +fp\+16 +c\-16 +f +
