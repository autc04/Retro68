#as: --gsframe
#warning: \.cfi\_escape with op \(0xf\)
#objdump: --sframe=.sframe
#name: Signal Frame with no FREs
#...
Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    CFA fixed RA offset: -8
    Num FDEs: 1
    Num FREs: 0

  Function Index :

    func idx \[0\]: pc = 0x0, size = 3 bytes, attr = "S"
    STARTPC + CFA + FP + RA +
