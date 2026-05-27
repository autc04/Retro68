	.option	norelax

	# Relative to the current instruction.
	j	.+0x0ffffe
	j	.-0x100000

	# Relative to local labels (make sure that all instructions occupy 4-bytes).
	j	1f+0x0ffffe-4
1:
	j	2f-0x100000-4
2:
3:
	lui	t0, 0x12345
	j	3b+0x0ffffe+4
4:
	lui	t0, 0x2abcd
	j	4b-0x100000+4
