#as: --gsframe-3
#source: sframe-gc-sections-2.s
#objdump: --sframe=.sframe
#ld: -r --gc-sections
#name: SFrame gc sections II

.*: +file format .*

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
#...
    CFA fixed RA offset: -8
    Num FDEs: 2
    Num FREs: 5

  Function Index :

    func idx \[0\]: pc = 0x[0-9a-f]+, size = 5 bytes
    STARTPC +CFA +FP +RA +
    [0-9a-f]+ +sp\+8 +u +f +

    func idx \[1\]: pc = 0x[0-9a-f]+, size = 6 bytes
    STARTPC +CFA +FP +RA +
    [0-9a-f]+ +sp\+8 +u +f +
    [0-9a-f]+ +sp\+16 +c-16 +f +
    [0-9a-f]+ +fp\+16 +c-16 +f +
    [0-9a-f]+ +sp\+8 +c-16 +f +
