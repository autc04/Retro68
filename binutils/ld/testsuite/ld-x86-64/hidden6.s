	.text
.globl bar
	.type	bar, @function
bar:
	mov	foo(%rip), %eax
	.size	bar, .-bar
	.hidden	foo
