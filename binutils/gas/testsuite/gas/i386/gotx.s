	.text
	.global _start
_start:
	jmp *_start@GOT(%ebx)
