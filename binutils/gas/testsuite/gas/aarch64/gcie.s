        // GIC CDAFF
	gic	cdaff, x0
	gic	cdaff, xzr

	// GIC CDDI
	gic	cddi, x0
	gic	cddi, xzr

	// GIC CDDIS
	gic	cddis, x0
	gic	cddis, xzr

	// GIC CDEN
	gic	cden, x0
	gic	cden, xzr

	// GIC CDEOI
	gic	cdeoi, x0
	gic	cdeoi, xzr

	// GIC CDHM
	gic	cdhm, x0
	gic	cdhm, xzr

	// GIC CDPEND
	gic	cdpend, x0
	gic	cdpend, xzr

	// GIC CDPRI
	gic	cdpri, x0
	gic	cdpri, xzr

	// GIC CDRCFG
	gic	cdrcfg, x0
	gic	cdrcfg, xzr

	// GICR CDIA
	gicr	x0, cdia
	gicr	xzr, cdia

	// GICR CDNMIA
	gicr	x0, cdnmia
	gicr	xzr, cdnmia

	// GIC VDAFF
	gic	vdaff, x0
	gic	vdaff, xzr

	// GIC VDDI
	gic	vddi, x0
	gic	vddi, xzr

	// GIC VDDIS
	gic	vddis, x0
	gic	vddis, xzr

	// GIC VDEN
	gic	vden, x0
	gic	vden, xzr

	// GIC VDHM
	gic	vdhm, x0
	gic	vdhm, xzr

	// GIC VDPEND
	gic	vdpend, x0
	gic	vdpend, xzr

	// GIC VDPRI
	gic	vdpri, x0
	gic	vdpri, xzr

	// GIC VDRCFG
	gic	vdrcfg, x0
	gic	vdrcfg, xzr

	// GIC LDAFF
	gic	ldaff, x0
	gic	ldaff, xzr

	// GIC LDDI
	gic	lddi, x0
	gic	lddi, xzr

	// GIC LDDIS
	gic	lddis, x0
	gic	lddis, xzr

	// GIC LDEN
	gic	lden, x0
	gic	lden, xzr

	// GIC LDHM
	gic	ldhm, x0
	gic	ldhm, xzr

	// GIC LDPEND
	gic	ldpend, x0
	gic	ldpend, xzr

	// GIC LDPRI
	gic	ldpri, x0
	gic	ldpri, xzr

	// GIC LDRCFG
	gic	ldrcfg, x0
	gic	ldrcfg, xzr

	// GSB SYS
	gsb	sys

	// GSB ACK
	gsb	ack

	// Don't disassemble gsb with nonzero Rt
	sys #0, c12, c0, #0, x0
	sys #0, c12, c0, #1, x0
