# Check 64bit MOVRS instructions

	.text
_start:
	movrsw	-256(%rdx), %dx
	movrsl	-512(%rdx), %edx
	movrsq	-1024(%rdx), %r12
	movrsb	-128(%rdx), %bl
