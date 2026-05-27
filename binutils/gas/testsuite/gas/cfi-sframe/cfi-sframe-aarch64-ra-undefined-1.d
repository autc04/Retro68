#as: --gsframe
#objdump: --sframe=.sframe
#name: SFrame generation on aarch64 - .cfi_undefined RA
#...
Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 1
    Num FREs: 4

  Function Index :

    func idx \[0\]: pc = 0x0, size = 16 bytes
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+0 +u +u +
    0+0004 +sp\+16 +c\-16 +c\-8 +
    0+0008 +RA undefined
    0+000c +RA undefined
