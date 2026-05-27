	.section .rdata

	.ascii		"!"
	.cv_ucomp	0
	.ascii		"!"
	.cv_ucomp	1
	.ascii		"!"
	.cv_ucomp	42
	.ascii		"!"
	.cv_ucomp	127
	.ascii		"!"
	.cv_ucomp	128
	.ascii		"!"
	.cv_ucomp	1337
	.ascii		"!"
	.cv_ucomp	16383
	.ascii		"!"
	.cv_ucomp	16384
	.ascii		"!"
	.cv_ucomp	1000000
	.ascii		"!"
	.cv_ucomp	536870911

	.ascii		"!"
	.cv_scomp	0
	.ascii		"!"
	.cv_scomp	1
	.ascii		"!"
	.cv_scomp	42
	.ascii		"!"
	.cv_scomp	127
	.ascii		"!"
	.cv_scomp	128
	.ascii		"!"
	.cv_scomp	1337
	.ascii		"!"
	.cv_scomp	16383
	.ascii		"!"
	.cv_scomp	16384
	.ascii		"!"
	.cv_scomp	1000000
	.ascii		"!"
	.cv_scomp	268435455

	.ascii		"!"
	.cv_scomp	-1
	.ascii		"!"
	.cv_scomp	-42
	.ascii		"!"
	.cv_scomp	-127
	.ascii		"!"
	.cv_scomp	-128
	.ascii		"!"
	.cv_scomp	-1337
	.ascii		"!"
	.cv_scomp	-16383
	.ascii		"!"
	.cv_scomp	-16384
	.ascii		"!"
	.cv_scomp	-1000000
	.ascii		"!"
	.cv_scomp	-268435455

	.ascii		"!"
	# 2
	.cv_ucomp	addr2 - addr1
	.ascii		"!"
	# 4
	.cv_ucomp	addr3 - addr1
	.ascii		"!"
	# 4100
	.cv_ucomp	addr4 - addr1

	.ascii		"!"
	# 2
	.cv_scomp	addr2 - addr1
	.ascii		"!"
	# 4
	.cv_scomp	addr3 - addr1
	.ascii		"!"
	# 4100
	.cv_scomp	addr4 - addr1
	.ascii		"!"
	# -2
	.cv_scomp	addr1 - addr2
	.ascii		"!"
	# -4
	.cv_scomp	addr1 - addr3
	.ascii		"!"
	# -4100
	.cv_scomp	addr1 - addr4
	.ascii		"!"

	.data
	.space		1
addr1: # .data + 0x1
	.space		2
addr2: # .data + 0x3
	.space		2
	# force new fragment
	.text
	.data
addr3: # .data + 0x5
	.space		0x1000
addr4: # .data + 0x1005
