/* Test expression argument with inner white spaces and a white space
   before argument added by C preprocessor.  */

	.macro test arg1, arg2, arg3
	.byte \arg1
	.byte \arg2
	.byte \ arg3
	.endm

	.data
 	test  0x10 + 0, 0x10 + 1, 0x10 + 2
 	test  0x10 + 3, 0x10 + 4, 0x15
	.byte 0,0,0,0,0,0,0,0,0,0
