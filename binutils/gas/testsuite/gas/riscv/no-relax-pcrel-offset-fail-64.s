	.option	norelax

	## Fail on RV64, wrap without errors on RV32.

	# Relative to the current instruction.

1:
	auipc	a0, %pcrel_hi(.+0x7ffff7ff+1)
	addi	a0, a0, %pcrel_lo(1b)
2:
	auipc	a0, %pcrel_hi(.-0x80000800-1)
	addi	a0, a0, %pcrel_lo(2b)

	# Relative to local labels (all instructions occupy 4-bytes).

3:
	auipc	a0, %pcrel_hi(4f+0x7ffff7ff-4+1)
4:
	addi	a0, a0, %pcrel_lo(3b)
5:
	auipc	a0, %pcrel_hi(6f-0x80000800-4-1)
6:
	addi	a0, a0, %pcrel_lo(5b)

7:
	auipc	a0, %pcrel_hi(6b+0x7ffff7ff+4+1)
8:
	addi	a0, a0, %pcrel_lo(7b)
9:
	auipc	a0, %pcrel_hi(8b-0x80000800+4-1)
	addi	a0, a0, %pcrel_lo(9b)
