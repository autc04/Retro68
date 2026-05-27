#name: SFrame generation on s390x - FP and then RA saved in FPR registers
#objdump: --sframe=.sframe
#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 1
    Num FREs: 5

  Function Index :

    func idx \[0\]: pc = 0x0, size = 26 bytes, attr = "F"
    STARTPC +CFA +FP +RA +
    0+0000 +sp\+160 +u +u +
    0+0004 +sp\+160 +r17\+0 +U +
    0+0008 +sp\+160 +r17\+0 +r16\+0 +
    0+0014 +sp\+160 +r17\+0 +U +
    0+0018 +sp\+160 +u +u +
#pass
