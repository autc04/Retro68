# Test extended forms of string section.  Only the first of these was supported
# in binutils 2.43 and earlier, but it failed to set the entity size.	
	.section .str1,"S"
	.asciz "abc"
	.section .str2,"S",1
	.asciz "def"
	.section .str3,"S",%progbits
	.asciz "ghi"
	.section .str4,"S",%progbits,2
	.short 32, 0
# The following is used in older versions of gcc to test for gas
# string merge support.  On arm, @ begins a comment.
	.section .rodata.str, "aMS", @progbits, 1
	.asciz "jkl"
