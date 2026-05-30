	.text
	.option rvc
rvc_func:
	ret

	.option norvc
	.p2align 3
non_rvc_func:
	ret

insn:
	nop
	.insn 0
	.p2align 3
	ret

hword:
	nop
	.hword 0
	.p2align 3
	ret

byte:
	nop
	.byte 0
	.p2align 3
	ret

	.p2align 3
func1:
	nop
	ret

	.pushsection .text1, "ax", @progbits
	.option rvc
	nop
	.popsection

func2:
	ret

	.pushsection .text1, "ax", @progbits
	nop
	.option norvc
	.popsection

	.p2align 3
func3:
	nop
	ret
