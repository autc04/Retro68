#as: --gsframe
#source: sframe-foo.s
#source: sframe-bar.s
#objdump: --sframe=.sframe
#ld: -shared --no-rosegment -z separate-code
#name: SFrame for plt0 and pltN

.*: +file format .*

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_SORTED,
           SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: \-8
#...

  Function Index :

    func idx \[0\]: pc = 0x1000, size = 16 bytes
    STARTPC +CFA +FP +RA +
    0+1000 +sp\+16 +u +f +
    0+1006 +sp\+24 +u +f +

    func idx \[1\]: pc = 0x1010, size = 16 bytes
    STARTPC\[m\] +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+000b +sp\+16 +u +f +

#...
