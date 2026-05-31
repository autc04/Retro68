	.text
# All the following should be illegal
	kmovd	foo@gotntpoff(%eax), %k0

	/* Invalid testcase for R_386_TLS_GD.  */
	addl foo@tlsgd(,%ebx,1), %eax
	leal foo@tlsgd(,%ecx,1), %eax
	leal foo@tlsgd(,%ebx,2), %eax
	leal foo@tlsgd(%ecx,%ebx,1), %eax
	leal foo@tlsgd(,%ebx,1), %ecx
	leal foo@tlsgd(%ebx), %ecx
	leal foo@tlsgd(%eax), %eax
	lea foo@tlsgd(%ebx), %ax

	/* Invalid testcase for R_386_TLS_LDM.  */
	addl foo@tlsldm(%ebx), %eax
	leal foo@tlsldm(%ebx), %ecx
	leal foo@tlsldm(%eax), %eax
	leal foo@tlsldm(,%ebx,1), %eax
	lea foo@tlsldm(%ebx), %ax

	/* Invalid testcase for R_386_TLS_GOTDESC.  */
	addl x@tlsdesc(%ebx), %eax
	leal x@tlsdesc(%ecx), %eax
	leal x@tlsdesc(,%ecx,1), %eax
	lea  x@tlsdesc(%ebx), %ax

	/* Invalid testcase for R_386_TLS_IE.  */
	subl foo@indntpoff, %ecx
	addl foo@indntpoff(%ebx), %ecx
	movl foo@indntpoff(%ebx), %ecx
	add foo@indntpoff, %cx
	addl $foo@indntpoff, %eax
	addl %ecx, foo@indntpoff
	addl $0x9090,foo@indntpoff
	addl $0x90909090,foo@indntpoff
	movl foo@indntpoff,%eax
	movl %edx,foo@indntpoff(%eax)
	movw %ss,foo@indntpoff(%eax)
	movw foo@indntpoff(%eax),%ss
	movl $0x90909090,foo@indntpoff(%eax)
	movl $foo@indntpoff, %eax

	/* Invalid testcase for R_386_TLS_GOTIE.  */
	leal foo@gotntpoff(%ebx), %ecx
	subl foo@gotntpoff(,%ebx,1), %ecx
	lea foo@gotntpoff(%ebx), %cx
	subl %ecx, foo@gotntpoff(%ebx)
	subl $0x9090,foo@gotntpoff(%ebx)
	subl $0x90909090,foo@gotntpoff(%eax)
	subl $foo@gotntpoff, %eax
	addl %ecx, foo@gotntpoff(%ebx)
	addl $0x9090,foo@gotntpoff(%ebx)
	addl $0x90909090,foo@gotntpoff(%eax)
	addl $foo@gotntpoff, %eax
	movl foo@gotntpoff,%eax
	movl %edx,foo@gotntpoff(%eax)
	movw %ss,foo@gotntpoff(%eax)
	movw foo@gotntpoff(%eax),%ss
	movl $0x90909090,foo@gotntpoff(%eax)
	movl $foo@gotntpoff, %eax

	/* Invalid testcase for R_386_TLS_IE_32.  */
	leal foo@gottpoff(%ebx), %ecx
	subl foo@gottpoff(,%ebx,1), %ecx
	add foo@gottpoff(%ebx), %cx
	subl %ecx, foo@gottpoff(%ebx)
	subl $0x9090,foo@gottpoff(%ebx)
	subl $0x90909090,foo@gottpoff(%eax)
	subl $foo@gottpoff, %eax
	addl %ecx, foo@gottpoff(%ebx)
	addl $0x9090,foo@gottpoff(%ebx)
	addl $0x90909090,foo@gottpoff(%eax)
	movl foo@gottpoff,%eax
	movl %edx,foo@gottpoff(%eax)
	movw %ss,foo@gottpoff(%eax)
	movw foo@gottpoff(%eax),%ss
	movl $0x90909090,foo@gottpoff(%eax)
	movl $foo@gottpoff, %eax

	/* Invalid testcase for R_386_TLS_DESC_CALL.  */
	leal foo@tlscall(%eax), %ebx
	call *x@tlscall(%ebx)
	call *x@tlscall(,%eax,1)
	call *x@tlscall(%bx)
