	.text
	.type start,"function"
	.global start
start:
	.type _start,"function"
	.global _start
_start:
	.type __start,"function"
	.global __start
__start:
	.type main,"function"
	.global main
main:
	.type _main,"function"
	.global _main
_main:
	.dc.a 0
	.section .rodata,"a",%progbits
	.zero 8
	.section .bss,"aw",%nobits
	.zero 8
	.section	.note.ABI-tag,"a",%progbits
	.align 4
	.zero 32
	.ident	"GCC: (GNU) 14.2.1"
	.section	.note.GNU-stack,"",%progbits
