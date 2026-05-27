#as: --gsframe
#source: sframe-foo.s
#source: sframe-bar.s
#objdump: --sframe=.sframe
#ld: -r --no-rosegment
#name: SFrame simple link - relocatable

.*: +file format .*

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: \-8
    Num FDEs: 2
    Num FREs: 8

  Function Index :


    func idx \[0\]: pc = 0x0, size = 53 bytes
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+0001 +sp\+16 +c-16 +f +
    0+0004 +fp\+16 +c-16 +f +
    0+0034 +sp\+8 +c-16 +f +

    func idx \[1\]: pc = 0x35, size = 37 bytes
    STARTPC +CFA +FP +RA +
    0+0035 +sp\+8 +u +f +
    0+0036 +sp\+16 +c-16 +f +
    0+0039 +fp\+16 +c-16 +f +
    0+0059 +sp\+8 +c-16 +f +
