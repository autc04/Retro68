# Testcase with a variety of "change of flow instructions"
#
# This test does not have much going on wrt synthesis of CFI;
# it just aims to ensure x8_64 -> ginsn decoding behaves
# gracefully for these "change of flow instructions"
	.text
	.globl  foo
	.type   foo, @function
foo:
	addq    %rdx, %rax
	loop    foo
	notrack jmp     *%rax
	call    *%r8
	call    *cost_arr(,%rax,8)
	call    *(,%rdx, 4)
	call    *symbol+1
	jecxz   .L179
	jmp     *%r8
	jmp     *48(%rdi)
	jmp     *cost_arr(,%rax,8)
	jmp     *symbol+1
	jo      .L179
.L179:
	ret
.LFE0:
	.size   foo, .-foo
