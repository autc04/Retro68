#name: SRMASK2 System Register
#as: -march=armv9.6-a -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
.*:	d51c15c0 	msr	hcrmask_el2, x0
.*:	d53c15c0 	mrs	x0, hcrmask_el2
.*:	d51c15e0 	msr	hcrxmask_el2, x0
.*:	d53c15e0 	mrs	x0, hcrxmask_el2
.*:	d51c1580 	msr	nvhcrmask_el2, x0
.*:	d53c1580 	mrs	x0, nvhcrmask_el2
.*:	d51c15a0 	msr	nvhcrxmask_el2, x0
.*:	d53c15a0 	mrs	x0, nvhcrxmask_el2
