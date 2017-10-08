// Test the disassembler's detection of illegal binary sequences.

// PR 21380:

	.inst 0x4dc2d4ec
	.inst 0x4de2d4fc
	.inst 0x4dc2f4ec
	.inst 0x4de2f4fc

