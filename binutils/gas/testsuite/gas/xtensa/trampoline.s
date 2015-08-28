	.text
	j	1f
	j	1f
	j	2f
	j	3f
	.rep	25000
99:
	and	a2, a2, a3
	bne	a2, a3, 99b
	.endr
1:
	j	1b
2:
	j	2b

	.rep	25000
	and	a2, a2, a3
	_ret
	.endr
3:
	j	3b
