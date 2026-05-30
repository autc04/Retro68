	.thumb
	.cpu cortex-m33
	.syntax unified
	.global __start
	.weak	bad
	.type __start, function
__start:
	push	{r4, lr}
	bl	bad
	pop	{r4, pc}
