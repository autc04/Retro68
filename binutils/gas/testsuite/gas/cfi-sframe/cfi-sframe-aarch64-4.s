## ARMv9.5 enhanced the existing PAuth feature with a new extension called
## PAuth_LR. It aims at hardening the PAC in a signed return address. When
## signing the return address in LR, the PC is used as a diversifier, in
## addition to the SP to generate the PAC code.
## As for PAuth, when the pointers are mangled with PAuth_LR, the stack trace
## generator needs to know so it can mask off the PAC from the pointer value to
## recover the return address, and conversely, skip doing so if the pointers are
## not mangled.
##
## .cfi_negate_ra_state_with_pc CFI directive is used to convey this information.
##
## SFrame has currently no support for this. The support is expected in SFrame
## v3. This testcase ensures that the directive is understood, and outputs
## a warning to the user before failing to generate the FDE.
	.cfi_startproc
	.long 0
	.cfi_def_cfa_offset 16
	.cfi_negate_ra_state_with_pc
	.long 0
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	.long 0
	.cfi_endproc
