#as: -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

[^:]+:

0+ <.*>:
.*:	d51b22a0 	msr	tpmax0_el0, x0
.*:	d53b22a0 	mrs	x0, tpmax0_el0
.*:	d51822a0 	msr	tpmax0_el1, x0
.*:	d53822a0 	mrs	x0, tpmax0_el1
.*:	d51d22a0 	msr	tpmax0_el12, x0
.*:	d53d22a0 	mrs	x0, tpmax0_el12
.*:	d51c22a0 	msr	tpmax0_el2, x0
.*:	d53c22a0 	mrs	x0, tpmax0_el2
.*:	d51b22e0 	msr	tpmax1_el0, x0
.*:	d53b22e0 	mrs	x0, tpmax1_el0
.*:	d51822e0 	msr	tpmax1_el1, x0
.*:	d53822e0 	mrs	x0, tpmax1_el1
.*:	d51d22e0 	msr	tpmax1_el12, x0
.*:	d53d22e0 	mrs	x0, tpmax1_el12
.*:	d51c22e0 	msr	tpmax1_el2, x0
.*:	d53c22e0 	mrs	x0, tpmax1_el2
.*:	d51b2280 	msr	tpmin0_el0, x0
.*:	d53b2280 	mrs	x0, tpmin0_el0
.*:	d5182280 	msr	tpmin0_el1, x0
.*:	d5382280 	mrs	x0, tpmin0_el1
.*:	d51d2280 	msr	tpmin0_el12, x0
.*:	d53d2280 	mrs	x0, tpmin0_el12
.*:	d51c2280 	msr	tpmin0_el2, x0
.*:	d53c2280 	mrs	x0, tpmin0_el2
.*:	d51b22c0 	msr	tpmin1_el0, x0
.*:	d53b22c0 	mrs	x0, tpmin1_el0
.*:	d51822c0 	msr	tpmin1_el1, x0
.*:	d53822c0 	mrs	x0, tpmin1_el1
.*:	d51d22c0 	msr	tpmin1_el12, x0
.*:	d53d22c0 	mrs	x0, tpmin1_el12
.*:	d51c22c0 	msr	tpmin1_el2, x0
.*:	d53c22c0 	mrs	x0, tpmin1_el2
