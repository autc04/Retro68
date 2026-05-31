# Check tls relocation 32-bit mode

	.text
_start:
	/* R_386_TLS_GD.  */
	leal foo@tlsgd(,%ebx,1), %eax
	leal foo@tlsgd(%ecx), %eax

	/* R_386_TLS_LDM.  */
	leal foo@tlsldm(%ebx), %eax

	/* R_386_TLS_GOTDESC.  */
	leal x@tlsdesc(%ebx), %eax

	/* R_386_TLS_IE.  */
	movl foo@indntpoff, %eax
	movl foo@indntpoff, %ebx
	addl foo@indntpoff, %edx

	/* R_386_TLS_GOTIE.  */
	subl foo@gotntpoff(%ebx), %ecx
	movl foo@gotntpoff(%ebx), %ecx
	addl foo@gotntpoff(%ebx), %ecx

	/* R_386_TLS_IE_32.  */
	subl foo@gottpoff(%ebx), %ecx
	movl foo@gottpoff(%ebx), %ecx
	addl foo@gottpoff(%ebx), %ecx

	/* R_386_TLS_DESC_CALL.  */
	call *foo@tlscall(%eax)
