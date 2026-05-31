	.text
Text:
	mov	$Text@rva, %eax
	mov	$Text@imgrel, %ecx

	add	Data@rva, %eax
	add	Data@imgrel, %ecx

	sub	$.@rva, %eax
	sub	$.@imgrel, %ecx

	xor	Xtrn@rva(%rbx), %eax
	xor	Xtrn@imgrel(%rbx), %ecx

	.data
Data:
	.rva	Text
	.long	Text@rva
	.long	Text@imgrel

	.rva	Data
	.long	Data@rva
	.long	Data@imgrel

	.rva	.
	.long	.@rva
	.long	.@imgrel

	.rva	Xtrn
	.long	Xtrn@rva
	.long	Xtrn@imgrel
