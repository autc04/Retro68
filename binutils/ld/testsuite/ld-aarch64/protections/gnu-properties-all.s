	.text
	.globl _start
	.type _start,@function
_start:
	mov x1, #2
	bl foo

	.set NT_GNU_PROPERTY_TYPE_0,             5
	.set GNU_PROPERTY_AARCH64_FEATURE_1_AND, 0xc0000000
	.set GNU_PROPERTY_AARCH64_FEATURE_1_BTI, (0x1 << 0)
	.set GNU_PROPERTY_AARCH64_FEATURE_1_PAC, (0x1 << 1)
	.set GNU_PROPERTY_AARCH64_FEATURE_1_GCS, (0x1 << 2)
	.set GNU_PROPERTY_AARCH64_FEATURE_1_VALUE, ( GNU_PROPERTY_AARCH64_FEATURE_1_BTI | GNU_PROPERTY_AARCH64_FEATURE_1_PAC | GNU_PROPERTY_AARCH64_FEATURE_1_GCS )

	.section ".note.gnu.property", "a"
	.p2align 3
	.long 1f - 0f			/* name length */
	.long 5f - 2f			/* data length */
	.long NT_GNU_PROPERTY_TYPE_0	/* note type */
0:	.asciz "GNU"			/* vendor name */
1:
	.p2align 3
2:	.long GNU_PROPERTY_AARCH64_FEATURE_1_AND /* pr_type.  */
	.long 4f - 3f				 /* pr_datasz.  */
3:
	.long GNU_PROPERTY_AARCH64_FEATURE_1_VALUE
4:
	.p2align 3
5:
