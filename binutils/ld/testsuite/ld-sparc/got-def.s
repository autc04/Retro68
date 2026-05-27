	.text
.LLGETPC0:
	retl
	 add	%o7, %l7, %l7
	.global got
	.type got, #function
	.proc   04
got:
	save    %sp, -160, %sp
	sethi	%hi(_GLOBAL_OFFSET_TABLE_-4), %l7
	call	.LLGETPC0
	 add	%l7, %lo(_GLOBAL_OFFSET_TABLE_+4), %l7
	mov	%l7, %o0
	ret
	 restore
