	.globl text_symbol1
	.globl text_symbol2
	.globl text_symbol3
	.macro ENDFN name:req
	.def \name
	.type 0x20	/* DT_FUNC */
	.scl 2		/* C_EXT */
	.endef
	.def \name
	.scl 0xff	/* C_EFCN */
	.val .
	.endef
	.endm
	.text
text_symbol1:
	.long 0
	.long 0
	.long 0
	ENDFN text_symbol1
text_symbol2:
	.long 0
	.long 0
	ENDFN text_symbol2
text_symbol3:
	.long 0
	ENDFN text_symbol3
