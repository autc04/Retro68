	.text
Text:
	mov	$Text@secidx16, %cx
	add	$Data@secidx16, %cx
	sub	$.@secidx16, %cx
	xor	$Xtrn@secidx16, %cx

	.data
Data:
	.word	Text@secidx16
	.word	Data@secidx16
	.word	.@secidx16
	.word	Xtrn@secidx16
