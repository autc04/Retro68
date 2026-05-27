#objdump: -dr
#as: -march=armv8-a+gcie

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
[^:]+:	d508c160 	gic	cdaff, x0
[^:]+:	d508c17f 	gic	cdaff, xzr
[^:]+:	d508c200 	gic	cddi, x0
[^:]+:	d508c21f 	gic	cddi, xzr
[^:]+:	d508c100 	gic	cddis, x0
[^:]+:	d508c11f 	gic	cddis, xzr
[^:]+:	d508c120 	gic	cden, x0
[^:]+:	d508c13f 	gic	cden, xzr
[^:]+:	d508c1e0 	gic	cdeoi, x0
[^:]+:	d508c1ff 	gic	cdeoi, xzr
[^:]+:	d508c220 	gic	cdhm, x0
[^:]+:	d508c23f 	gic	cdhm, xzr
[^:]+:	d508c180 	gic	cdpend, x0
[^:]+:	d508c19f 	gic	cdpend, xzr
[^:]+:	d508c140 	gic	cdpri, x0
[^:]+:	d508c15f 	gic	cdpri, xzr
[^:]+:	d508c1a0 	gic	cdrcfg, x0
[^:]+:	d508c1bf 	gic	cdrcfg, xzr
[^:]+:	d508c300 	gicr	x0, cdia
[^:]+:	d508c31f 	gicr	xzr, cdia
[^:]+:	d508c320 	gicr	x0, cdnmia
[^:]+:	d508c33f 	gicr	xzr, cdnmia
[^:]+:	d50cc160 	gic	vdaff, x0
[^:]+:	d50cc17f 	gic	vdaff, xzr
[^:]+:	d50cc200 	gic	vddi, x0
[^:]+:	d50cc21f 	gic	vddi, xzr
[^:]+:	d50cc100 	gic	vddis, x0
[^:]+:	d50cc11f 	gic	vddis, xzr
[^:]+:	d50cc120 	gic	vden, x0
[^:]+:	d50cc13f 	gic	vden, xzr
[^:]+:	d50cc220 	gic	vdhm, x0
[^:]+:	d50cc23f 	gic	vdhm, xzr
[^:]+:	d50cc180 	gic	vdpend, x0
[^:]+:	d50cc19f 	gic	vdpend, xzr
[^:]+:	d50cc140 	gic	vdpri, x0
[^:]+:	d50cc15f 	gic	vdpri, xzr
[^:]+:	d50cc1a0 	gic	vdrcfg, x0
[^:]+:	d50cc1bf 	gic	vdrcfg, xzr
[^:]+:	d50ec160 	gic	ldaff, x0
[^:]+:	d50ec17f 	gic	ldaff, xzr
[^:]+:	d50ec200 	gic	lddi, x0
[^:]+:	d50ec21f 	gic	lddi, xzr
[^:]+:	d50ec100 	gic	lddis, x0
[^:]+:	d50ec11f 	gic	lddis, xzr
[^:]+:	d50ec120 	gic	lden, x0
[^:]+:	d50ec13f 	gic	lden, xzr
[^:]+:	d50ec220 	gic	ldhm, x0
[^:]+:	d50ec23f 	gic	ldhm, xzr
[^:]+:	d50ec180 	gic	ldpend, x0
[^:]+:	d50ec19f 	gic	ldpend, xzr
[^:]+:	d50ec140 	gic	ldpri, x0
[^:]+:	d50ec15f 	gic	ldpri, xzr
[^:]+:	d50ec1a0 	gic	ldrcfg, x0
[^:]+:	d50ec1bf 	gic	ldrcfg, xzr
[^:]+:	d508c01f 	gsb	sys
[^:]+:	d508c03f 	gsb	ack
[^:]+:	d508c000 	sys	#0, C12, C0, #0, x0
[^:]+:	d508c020 	sys	#0, C12, C0, #1, x0
