#as: --gsframe
#source: sframe-foo.s
#source: sframe-bar.s
#objdump: --sframe=.sframe
#ld: -shared --no-rosegment
#name: SFrame for plt0 and pltN

.*: +file format .*

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_SORTED,
           SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 4
    Num FREs: 8

  Function Index :

    func idx \[0\]: pc = 0x1e8, size = 32 bytes
    STARTPC +CFA +FP +RA +
    0+1e8 +sp\+160 +u +u +

    func idx \[1\]: pc = 0x208, size = 32 bytes
    STARTPC\[m\] +CFA +FP +RA +
    0+0 +sp\+160 +u +u +

#...
