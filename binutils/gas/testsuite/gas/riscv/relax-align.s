	.text
	.option rvc
rvc_func:
	ret

	.option norvc
	.p2align 2
non_rvc_func:
	ret

insn:
	nop
	.insn 0
	.p2align 2
	ret

hword:
	nop
	.hword 0
	.p2align 2
	ret

byte:
	nop
	.byte 0
	.p2align 2
	ret
