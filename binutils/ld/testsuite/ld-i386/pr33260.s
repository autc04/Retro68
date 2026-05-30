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
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	leal	vtable@GOTOFF(%eax), %eax
	ret
	.cfi_endproc
	.size	f, .-f
	.section	.data.rel,"aw"
	.align 4
	.type	vtable, @object
	.size	vtable, 8
vtable:
	.long	my_func
	.long	my_data
	.protected	my_data
	.globl	my_data
	.bss
	.align 4
	.type	my_data, @object
	.size	my_data, 4
my_data:
	.zero	4
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
	.section	.note.GNU-stack,"",@progbits
