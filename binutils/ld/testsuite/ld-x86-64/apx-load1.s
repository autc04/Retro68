	.data
	.type	bar, @object
bar:
	.byte	1
	.size	bar, .-bar
	.globl	foo
	.type	foo, @object
foo:
	.byte	1
	.size	foo, .-foo
	.text
	.globl	_start
	.type	_start, @function
_start:
	adcl	bar@GOTPCREL(%rip), %r16d
	addl	bar@GOTPCREL(%rip), %r17d
	andl	bar@GOTPCREL(%rip), %r18d
	cmpl	bar@GOTPCREL(%rip), %r19d
	orl	bar@GOTPCREL(%rip), %r20d
	sbbl	bar@GOTPCREL(%rip), %r21d
	subl	bar@GOTPCREL(%rip), %r22d
	xorl	bar@GOTPCREL(%rip), %r23d
	testl	%r24d, bar@GOTPCREL(%rip)
	adcq	bar@GOTPCREL(%rip), %r16
	addq	bar@GOTPCREL(%rip), %r17
	andq	bar@GOTPCREL(%rip), %r18
	cmpq	bar@GOTPCREL(%rip), %r19
	orq	bar@GOTPCREL(%rip), %r20
	sbbq	bar@GOTPCREL(%rip), %r21
	subq	bar@GOTPCREL(%rip), %r22
	xorq	bar@GOTPCREL(%rip), %r23
	testq	%r24, bar@GOTPCREL(%rip)

	adcl	foo@GOTPCREL(%rip), %r16d
	addl	foo@GOTPCREL(%rip), %r17d
	andl	foo@GOTPCREL(%rip), %r18d
	cmpl	foo@GOTPCREL(%rip), %r19d
	orl	foo@GOTPCREL(%rip), %r20d
	sbbl	foo@GOTPCREL(%rip), %r21d
	subl	foo@GOTPCREL(%rip), %r22d
	xorl	foo@GOTPCREL(%rip), %r23d
	testl	%r24d, foo@GOTPCREL(%rip)
	adcq	foo@GOTPCREL(%rip), %r16
	addq	foo@GOTPCREL(%rip), %r17
	andq	foo@GOTPCREL(%rip), %r18
	cmpq	foo@GOTPCREL(%rip), %r19
	orq	foo@GOTPCREL(%rip), %r20
	sbbq	foo@GOTPCREL(%rip), %r21
	subq	foo@GOTPCREL(%rip), %r22
	xorq	foo@GOTPCREL(%rip), %r23
	testq	%r24, foo@GOTPCREL(%rip)

	{evex} adc	bar@GOTPCREL(%rip), %r16d
	{nf}   add	bar@GOTPCREL(%rip), %r17d
	{nf}   and	bar@GOTPCREL(%rip), %r18d
	       ccmpt	bar@GOTPCREL(%rip), %r19d
	{nf}   or	bar@GOTPCREL(%rip), %r20d
	{evex} sbb	bar@GOTPCREL(%rip), %r21d
	{nf}   sub	bar@GOTPCREL(%rip), %r22d
	{nf}   xor	bar@GOTPCREL(%rip), %r23d
	       ctestt	bar@GOTPCREL(%rip), %r24d
	{evex} adc	bar@GOTPCREL(%rip), %r16
	{nf}   add	bar@GOTPCREL(%rip), %r17
	{nf}   and	bar@GOTPCREL(%rip), %r18
	       ccmpt	bar@GOTPCREL(%rip), %r19
	{nf}   or	bar@GOTPCREL(%rip), %r20
	{evex} sbb	bar@GOTPCREL(%rip), %r21
	{nf}   sub	bar@GOTPCREL(%rip), %r22
	{nf}   xor	bar@GOTPCREL(%rip), %r23
	       ctestt	bar@GOTPCREL(%rip), %r24

	{evex} adc	%r16d, bar@GOTPCREL(%rip)
	{nf}   add	%r17d, bar@GOTPCREL(%rip)
	{nf}   and	%r18d, bar@GOTPCREL(%rip)
	       ccmpt	%r19d, bar@GOTPCREL(%rip)
	{nf}   or	%r20d, bar@GOTPCREL(%rip)
	{evex} sbb	%r21d, bar@GOTPCREL(%rip)
	{nf}   sub	%r22d, bar@GOTPCREL(%rip)
	{nf}   xor	%r23d, bar@GOTPCREL(%rip)
	       ctestt	%r24d, bar@GOTPCREL(%rip)
	{evex} adc	%r16, bar@GOTPCREL(%rip)
	{nf}   add	%r17, bar@GOTPCREL(%rip)
	{nf}   and	%r18, bar@GOTPCREL(%rip)
	       ccmpt	%r19, bar@GOTPCREL(%rip)
	{nf}   or	%r20, bar@GOTPCREL(%rip)
	{evex} sbb	%r21, bar@GOTPCREL(%rip)
	{nf}   sub	%r22, bar@GOTPCREL(%rip)
	{nf}   xor	%r23, bar@GOTPCREL(%rip)
	       ctestt	%r24, bar@GOTPCREL(%rip)

	adc	bar@GOTPCREL(%rip), %r16d, %eax
	add	bar@GOTPCREL(%rip), %r17d, %ecx
	and	bar@GOTPCREL(%rip), %r18d, %edx
	or	bar@GOTPCREL(%rip), %r19d, %ebx
	sbb	bar@GOTPCREL(%rip), %r20d, %esp
	sub	bar@GOTPCREL(%rip), %r21d, %ebp
	xor	bar@GOTPCREL(%rip), %r22d, %esi
	adc	bar@GOTPCREL(%rip), %r16, %rax
	add	bar@GOTPCREL(%rip), %r17, %rcx
	and	bar@GOTPCREL(%rip), %r18, %rdx
	or	bar@GOTPCREL(%rip), %r19, %rbx
	sbb	bar@GOTPCREL(%rip), %r20, %rsp
	sub	bar@GOTPCREL(%rip), %r21, %rbp
	xor	bar@GOTPCREL(%rip), %r22, %rsi

	adc	%eax, bar@GOTPCREL(%rip), %r16d
	add	%ecx, bar@GOTPCREL(%rip), %r17d
	and	%edx, bar@GOTPCREL(%rip), %r18d
	or	%ebx, bar@GOTPCREL(%rip), %r19d
	sbb	%esp, bar@GOTPCREL(%rip), %r20d
	sub	%ebp, bar@GOTPCREL(%rip), %r21d
	xor	%esi, bar@GOTPCREL(%rip), %r22d
	adc	%rax, bar@GOTPCREL(%rip), %r16
	add	%rcx, bar@GOTPCREL(%rip), %r17
	and	%rdx, bar@GOTPCREL(%rip), %r18
	or	%rbx, bar@GOTPCREL(%rip), %r19
	sbb	%rsp, bar@GOTPCREL(%rip), %r20
	sub	%rbp, bar@GOTPCREL(%rip), %r21
	xor	%rsi, bar@GOTPCREL(%rip), %r22

	imul	bar@GOTPCREL(%rip), %r17
	{nf} imul bar@GOTPCREL(%rip), %r17
	imul	bar@GOTPCREL(%rip), %r17, %rdx
	imul	bar@GOTPCREL(%rip), %rcx, %r18
	{rex2} pushq bar@GOTPCREL(%rip)

	.size	_start, .-_start
	.p2align 12, 0x90
