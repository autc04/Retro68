	.text
# All the following should be illegal
	kmovq	foo@gottpoff(%rip), %k0
	kmovq	foo@tlsld(%rip), %k0

	/* Invalid testcase for R_X86_64_TLSGD.  */
	addq foo@tlsgd(%rip), %rdi
	leaq foo@tlsgd(%rip), %rax
	leaq foo@tlsgd(%rax), %rdi
	leaq foo@tlsgd(,%rax,1), %rdi
	leaq foo@tlsgd(%eip), %rdi
	leal foo@tlsgd(%rip), %edi

	/* Invalid testcase for R_X86_64_TLSLD.  */
	addq foo@tlsld(%rip), %rdi
	leaq foo@tlsld(%rip), %rax
	leaq foo@tlsld(%rax), %rdi
	leaq foo@tlsld(,%rax,1), %rdi
	leaq foo@tlsld(%eip), %rdi
	leal foo@tlsld(%rip), %edi

	/* Invalid testcase for R_X86_64_GOTPC32_TLSDESC.  */
	addq x@tlsdesc(%rip), %rax
	leaq x@tlsdesc(%rbx), %rax
	lea  x@tlsdesc(%eip), %rdi
	lea  x@tlsdesc(%rip), %eax
	lea  x@tlsdesc(%rip), %ax

	/* Invalid testcase for R_X86_64_GOTTPOFF.  */
	subq foo@gottpoff(%rip), %r12
	xorq foo@gottpoff(%rip), %rax
	addq foo@gottpoff(%rbx), %rax
	addq foo@gottpoff(%eip), %rax
	add  foo@gottpoff(%rip), %ax
	addq %rax, foo@gottpoff(%rip)
	addl $0x90909090, foo@gottpoff(%rip)
	add  $0x90, foo@gottpoff(%rip), %rax
	add  $0xffffffffffffffff, foo@gottpoff(%rip), %rax
	movq foo@gottpoff(%rbx), %rax
	movq %rax, foo@gottpoff(%rip)
	mov  %ss,foo@gottpoff(%rip)
	mov  foo@gottpoff(%rip),%ss
	movl $0x90909090,foo@gottpoff(%rip)
	mov  $foo@gottpoff, %rax


	/* Invalid testcase for R_X86_64_TLSDESC_CALL.  */
	leaq foo@tlscall(%rax), %rbx
	call *foo@tlscall(%rip)
	call *foo@tlscall(%ax)
