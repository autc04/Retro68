#as: --gsframe -O0
#objdump: --sframe=.sframe
#name: SFrame generation on x86_64 - .cfi_undefined RA
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: \-8
    Num FDEs: 1
    Num FREs: 5

  Function Index :

    func idx \[0\]: pc = 0x0, size = 7 bytes, attr = "F"
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+0001 +sp\+16 +c\-16 +U +
    0+0004 +fp\+16 +c\-16 +U +
    0+0005 +fp\+16 +c\-16 +r3\+0 +
    0+0006 +RA undefined
