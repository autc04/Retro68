#as: -march=armv9.5-a -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
.*:	d51d1020 	msr	actlr_el12, x0
.*:	d53d1020 	mrs	x0, actlr_el12
.*:	d51e11a0 	msr	fgwte3_el3, x0
.*:	d53e11a0 	mrs	x0, fgwte3_el3
.*:	d51c2380 	msr	hacdbsbr_el2, x0
.*:	d53c2380 	mrs	x0, hacdbsbr_el2
.*:	d51c23a0 	msr	hacdbscons_el2, x0
.*:	d53c23a0 	mrs	x0, hacdbscons_el2
.*:	d51c2340 	msr	hdbssbr_el2, x0
.*:	d53c2340 	mrs	x0, hdbssbr_el2
.*:	d51c2360 	msr	hdbssprod_el2, x0
.*:	d53c2360 	mrs	x0, hdbssprod_el2
.*:	d5184320 	msr	pm, x0
.*:	d5384320 	mrs	x0, pm
.*:	d5159d60 	msr	spmaccessr_el12, x0
.*:	d5359d60 	mrs	x0, spmaccessr_el12
.*:	d5189ba0 	msr	trbmpam_el1, x0
.*:	d5389ba0 	mrs	x0, trbmpam_el1

