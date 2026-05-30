	.thumb
	.cpu cortex-m33
	.syntax unified
	.section .text.bar
	.global bad @ untyped
#	.type bad, function
bad:	bx lr
