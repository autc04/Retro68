	.arch	armv8-a+memtag
	dc cigdvaps, x19

	.arch	armv8-a+memtag
	dc civaps, x20

	.arch	armv8-a+pops
	dc cigdvaps, x21

	.arch	armv8-a
	dc civaps, x22

	.arch	armv8-a
	dc cigdvaps, x23

	.arch	armv8-a+pops
	dc civaps

	.arch	armv8-a+memtag+pops
	dc cigdvaps
