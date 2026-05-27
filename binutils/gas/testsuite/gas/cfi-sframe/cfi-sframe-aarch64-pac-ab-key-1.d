#as: --gsframe
#objdump: --sframe=.sframe
#name: SFrame cfi_b_key_frame and cfi_negate_ra_state composite test
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 2
    Num FREs: 6

  Function Index :
    func idx \[0\]: pc = 0x0, size = 12 bytes
    STARTPC + CFA + FP + RA +
    0+0000 +sp\+0 +u +u +
    0+0004 +sp\+0 +u +u\[s\] +
    0+0008 +sp\+16 +c-16 +c-8\[s\] +

    func idx \[1\]: pc = 0xc, size = 20 bytes, pauth = B key
    STARTPC + CFA + FP +  RA +
    0+000c +sp\+0 +u +u +
    0+0010 +sp\+0 +u +u\[s\] +
    0+0014 +sp\+16 +c-16 +c-8\[s\] +

#pass
