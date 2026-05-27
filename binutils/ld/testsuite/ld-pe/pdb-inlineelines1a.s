.equ CV_SIGNATURE_C13, 4

.equ LF_STRING_ID, 0x1605

.equ CV_INLINEE_SOURCE_LINE_SIGNATURE, 0

.section ".debug$T", "rn"

.long CV_SIGNATURE_C13

/* Type 1000, string "hello" */
.string1:
.short .types_end - .string1 - 2
.short LF_STRING_ID
.long 0 /* sub-string */
.asciz "hello"
.byte 0xf2 /* padding */
.byte 0xf1 /* padding */

.types_end:
