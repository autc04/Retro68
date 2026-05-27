#as: --gsframe
#objdump: --sframe=.sframe
#name: SFrame cfi_negate_ra_state_with_pc test
#warning: \.cfi_negate_ra_state_with_pc

## The support for .cfi_negate_ra_state_with_pc is currently pending on SFrame
## v3 (currently in development). The unimplemented support is reported to the
## user as a warning. Then the handler returns an error that will cause no
## creation of a SFrame FDE later (hence "Num FDEs: 0").
## Note: this test will be expected to fail when the support of PAuth_LR in
## SFrame will be added, so will have to be fixed.

#...
Contents of the SFrame section .sframe:

  Header :

    Version: SFRAME_VERSION_3
    Flags: SFRAME_F_FDE_FUNC_START_PCREL
    Num FDEs: 0
    Num FREs: 0

  Function Index :

#pass
