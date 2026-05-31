#as: --gsframe
#source: sframe-start.s
#source: sframe-signal.s
#warning: \.cfi\_escape with op \(0xf\)
#objdump: --sframe=.sframe
#ld: -shared --no-rosegment -z separate-code
#name: SFrame link special case FDEs - 1

.*: +file format .*

Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_SORTED,
           SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: \-8
    Num FDEs: 4
    Num FREs: 5

  Function Index :

    func idx \[0\]: pc = 0x1000, size = 16 bytes
    STARTPC +CFA +FP +RA +
    0+1000 +sp\+16 +u +f +
    0+1006 +sp\+24 +u +f +

    func idx \[1\]: pc = 0x1010, size = 16 bytes
    STARTPC\[m\] +CFA +FP +RA +
    0+0000 +sp\+8 +u +f +
    0+000b +sp\+16 +u +f +

    func idx \[2\]: pc = 0x1020, size = 8 bytes
    STARTPC +CFA +FP +RA +
    0+1020 +RA undefined

    func idx \[3\]: pc = 0x1028, size = 2 bytes, attr = "S"
    STARTPC +CFA +FP +RA +
