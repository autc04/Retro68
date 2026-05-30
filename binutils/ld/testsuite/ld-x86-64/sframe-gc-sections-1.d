#as: --gsframe-3
#source: sframe-foo.s
#source: sframe-bar.s
#source: sframe-baz.s
#objdump: --sframe=.sframe
#ld: --gc-sections -e _start
#name: SFrame gc sections

.*: +file format .*

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_SORTED,
           SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: -8
    Num FDEs: 5
    Num FREs: 14

  Function Index :

    func idx \[0\]: pc = 0x[0-9a-f]+, size = 53 bytes
    STARTPC +CFA +FP +RA +
    [0-9a-f]+ +sp\+8 +u +f +
    [0-9a-f]+ +sp\+16 +c-16 +f +
    [0-9a-f]+ +fp\+16 +c-16 +f +
    [0-9a-f]+ +sp\+8 +c-16 +f +

    func idx \[1\]: pc = 0x[0-9a-f]+, size = 37 bytes
    STARTPC +CFA +FP +RA +
    [0-9a-f]+ +sp\+8 +u +f +
    [0-9a-f]+ +sp\+16 +c-16 +f +
    [0-9a-f]+ +fp\+16 +c-16 +f +
    [0-9a-f]+ +sp\+8 +c-16 +f +

    func idx \[2\]: pc = 0x[0-9a-f]+, size = 11 bytes
    STARTPC +CFA +FP +RA +
    [0-9a-f]+ +sp\+8 +u +f +
    [0-9a-f]+ +sp\+16 +c-16 +f +
    [0-9a-f]+ +fp\+16 +c-16 +f +
    [0-9a-f]+ +sp\+8 +c-16 +f +

    func idx \[3\]: pc = 0x[0-9a-f]+, size = 2 bytes
    STARTPC +CFA +FP +RA +
    [0-9a-f]+ +sp\+8 +u +f +

    func idx \[4\]: pc = 0x[0-9a-f]+, size = 14 bytes
    STARTPC +CFA +FP +RA +
    [0-9a-f]+ +sp\+8 +u +f +
