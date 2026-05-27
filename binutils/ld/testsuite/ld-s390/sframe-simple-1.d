#as: --gsframe
#source: sframe-foo.s
#source: sframe-bar.s
#objdump: --sframe=.sframe
#ld: -shared --no-rosegment
#name: SFrame simple link

.*: +file format .*

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_SORTED,
           SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 4
    Num FREs: 8

  Function Index :

#...
    func idx \[2\]: pc = 0x228, size = 8 bytes
    STARTPC +CFA +FP +RA +
    0+228 +sp\+160 +u +u +

    func idx \[3\]: pc = 0x230, size = 42 bytes
    STARTPC +CFA +FP +RA +
    0+230 +sp\+160 +u +u +
    0+236 +sp\+160 +u +c-48 +
    0+23c +sp\+320 +u +c-48 +
    0+252 +sp\+160 +u +c-48 +
    0+258 +sp\+160 +u +u +
