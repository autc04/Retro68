	.code16
	.text
plt:
	call	func@plt
	jz	func@plt
	jmp	func@plt
