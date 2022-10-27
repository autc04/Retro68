	.section .preinit_array.01000,"aw",%preinit_array
	.p2align 2
	.word 0

	.section .init_array.01000,"aw",%init_array
	.p2align 2
	.word 0

	.section .fini_array.01000,"aw",%fini_array
	.p2align 2
	.word 0

	.text
	.globl foo
foo:
	.word 0
