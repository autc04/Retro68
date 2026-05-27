	.text
	.p2align 4
	.globl	my_func
	.protected	my_func
	.type	my_func, @function
my_func:
	.cfi_startproc
	ret
	.cfi_endproc
	.size	my_func, .-my_func
	.p2align 4
	.globl	f
	.type	f, @function
f:
	.cfi_startproc
	leaq	vtable(%rip), %rax
	ret
	.cfi_endproc
	.size	f, .-f
	.section	.data.rel,"aw"
	.type	vtable, @object
.ifdef __x86_64__
	.align 16
	.size	vtable, 16
.else
	.align 8
	.size	vtable, 8
.endif
vtable:
	.dc.a	my_func
	.dc.a	my_data
	.protected	my_data
	.globl	my_data
	.bss
	.align 4
	.type	my_data, @object
	.size	my_data, 4
my_data:
	.zero	4
	.section	.note.GNU-stack,"",@progbits
