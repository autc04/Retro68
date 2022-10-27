target:
	lui	a5,%hi(target)
	lw	a5,%lo(target)(a5)

        .LA0: auipc     a5,%pcrel_hi(bar)
        lw      a0,%pcrel_lo(.LA0)(a5)

	call target
