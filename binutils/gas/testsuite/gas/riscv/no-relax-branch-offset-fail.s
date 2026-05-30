	.option	norelax

	# Relative to the current instruction.
	j	.+0x0ffffe+2
	j	.-0x100000-2

	# Relative to local labels (make sure that all instructions except "c.j" occupy 4-bytes).
	j	1f+0x0ffffe-4+2
1:
	j	2f-0x100000-4-2
2:
3:
	lui	t0, 0x12345
	j	3b+0x0ffffe+4+2
4:
	lui	t0, 0x2abcd
	j	4b-0x100000+4-2

	# Jump to odd address (violates instruction alignment).
	c.j	.+1
