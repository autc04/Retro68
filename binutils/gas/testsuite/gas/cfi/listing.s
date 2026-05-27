	.text
func:
	.cfi_startproc
	.cfi_remember_state
	.nop
	.cfi_escape 0x0a
	.nop
	.cfi_escape 0x02, 0x00, 0x02, 0x00
	.nop
	.cfi_escape 0x03; .cfi_escape data2(0)
	.cfi_escape 0x04; .cfi_escape data4(0)
	.nop
	.cfi_escape 0x0b
	.nop
	.cfi_restore_state
	.nop
	.cfi_endproc

func2:
	.cfi_startproc
	.nop
	/* DW_CFA_register reg127, reg129.  */
	.equiv DW_CFA_register, 0x09
	.cfi_escape DW_CFA_register, uleb128(127), uleb128(129)
	/* DW_CFA_val_expression reg250, ...  */
	.cfi_escape 0x16, uleb128(250)
	/* ... <len>.  */
	.cfi_escape uleb128(.LE0e - .LE0s)
	.cfi_label .LE0s
	/* DW_OP_breg3.  */
	.cfi_escape 0x73, sleb128(-1024)
	.cfi_label .LE0e
	.nop
	.cfi_endproc
