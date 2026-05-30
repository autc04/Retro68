	# Zicfiss
.option push
.option arch, rv64i_zicfiss
	sspush x1
	sspush x5
	sspopchk x1
	sspopchk x5
	ssrdp a0
	ssamoswap.w     a0,a0,0(a0)
	ssamoswap.w     a0,a0,(a0)
	ssamoswap.w.aq  a0,a0,0(a0)
	ssamoswap.w.aq  a0,a0,(a0)
	ssamoswap.w.rl  a0,a0,0(a0)
	ssamoswap.w.rl  a0,a0,(a0)
	ssamoswap.w.aqrl        a0,a0,0(a0)
	ssamoswap.w.aqrl        a0,a0,(a0)
	ssamoswap.d       a0, a0, 0(a0)
	ssamoswap.d       a0, a0, (a0)
	ssamoswap.d.aq    a0, a0, 0(a0)
	ssamoswap.d.aq    a0, a0, (a0)
	ssamoswap.d.rl    a0, a0, 0(a0)
	ssamoswap.d.rl    a0, a0, (a0)
	ssamoswap.d.aqrl  a0, a0, 0(a0)
	ssamoswap.d.aqrl  a0, a0, (a0)
.option pop

	# Zicfiss and Zcmop
.option push
.option arch, rv64ic_zicfiss_zcmop
	sspush x1
	c.sspush x1
	sspopchk x5
	c.sspopchk x5
.option pop

	# Zicfilp
.option push
.option arch, rv64ic_zicfilp
	lpad 0x111
.option pop
