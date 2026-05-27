	.attribute arch, "rv64i"
	# xmipscbop
	.option push
	.option arch, +xmipscbop
	mips.pref	0, 0(t1)
	mips.pref	31, 511(t2)
	.option pop

	# xmipscmov
	.option push
	.option arch, +xmipscmov
	mips.ccmov	a0,a1,a2,a3
	.option pop

	# xmipsexectl
	.option push
	.option arch, +xmipsexectl
	mips.ehb
	mips.ihb
	mips.pause
	.option pop

	# xmipslsp
	.option push
	.option arch, +xmipslsp
	mips.ldp	t3, t4, 0(t5)
	mips.ldp	t3, t4, 8(t5)
	mips.ldp	t6, gp, 112(ra)
	mips.ldp	t6, gp, 120(ra)
	mips.lwp	a0, a1, 0(a2)
	mips.lwp	a0, a1, 4(a2)
	mips.lwp	a3, a4, 120(a5)
	mips.lwp	a3, a4, 124(a5)
	mips.sdp	t3, t4, 0(t5)
	mips.sdp	t3, t4, 8(t5)
	mips.sdp	t6, gp, 112(ra)
	mips.sdp	t6, gp, 120(ra)
	mips.swp	a0, a1, 0(a2)
	mips.swp	a0, a1, 4(a2)
	mips.swp	a3, a4, 120(a5)
	mips.swp	a3, a4, 124(a5)
	.option pop
