## cfi_same_value when used with "not interesting" registers (from the
## perspective of SFrame section, non SP/FP/RA registers are not
## interesting) does not affect the asynchronicity of the SFrame stack
## trace information.  Such CFI directives can be skipped for SFrame
## stack trace info generation.
	.cfi_startproc
	.long 0
	.cfi_def_cfa_offset 16
	.cfi_same_value 1
	.cfi_same_value 2
	.long 0
	.cfi_endproc
