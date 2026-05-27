	.section ".note.gnu.property", "a"
	.p2align ALIGN
	.long .L1 - .L0		/* name length */
	.long .L3 - .L2		/* data length */
	.long 5			/* note type */
.L0:	.asciz "GNU"		/* vendor name */
.L1:
	.p2align ALIGN
.L2:	.long 3			/* pr_type.  */
	.long 0			/* pr_datasz.  */
.L3:
