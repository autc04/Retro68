.attribute arch, "rv64ic"	# file-level, rv64ic
add	a0, a0, a1
.option push
.option arch, +d2p0, +xvendor1p0
.option norvc
add	a0, a0, a1		# func-level, rv64i_d2p0_xvendor1p0
frcsr	a0
.option pop
.option arch, +m3p0, +d3p0, +xvendor32x3p0
add a0, a0, a1			# func-level, rv64i_m3p0_d3p0_c_xvendor32x3p0
.option arch, rv32i2p1c2p0
rdcycleh a0			# func-level, rv32i2p1_c2p0, won't affcet file-level attribute
