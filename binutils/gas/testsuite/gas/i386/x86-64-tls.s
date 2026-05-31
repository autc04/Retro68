# Check tls relocation 64-bit mode

	.text
_start:
	/* R_X86_64_TLSGD.  */
	leaq foo@tlsgd(%rip), %rdi

	/* R_X86_64_TLSLD.  */
	leaq foo@tlsld(%rip), %rdi

	/* R_X86_64_GOTPC32_TLSDESC.  */
	leaq     x@tlsdesc(%rip), %rax

	/* R_X86_64_GOTTPOFF.  */
	addq     foo@gottpoff(%rip), %r12
	movq     foo@gottpoff(%rip), %rax
	addq     foo@gottpoff(%rip), %r16
	movq     foo@gottpoff(%rip), %r20
	addq     %r30, foo@gottpoff(%rip), %r8
	addq     foo@gottpoff(%rip), %rax, %r20
	{nf} addq foo@gottpoff(%rip), %r16
	{nf} addq %r30, foo@gottpoff(%rip), %r8
	{nf} addq foo@gottpoff(%rip), %rax, %r20

	/* R_X86_64_TLSDESC_CALL.  */
	call *x@tlscall(%rax)
	call *x@tlscall(%eax)
