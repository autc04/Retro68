#as: -march=armv9.5-a -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
.*:	d5181400 	msr	sctlrmask_el1, x0
.*:	d5381400 	mrs	x0, sctlrmask_el1
.*:	d51c1400 	msr	sctlrmask_el2, x0
.*:	d53c1400 	mrs	x0, sctlrmask_el2
.*:	d51d1400 	msr	sctlrmask_el12, x0
.*:	d53d1400 	mrs	x0, sctlrmask_el12
.*:	d5181440 	msr	cpacrmask_el1, x0
.*:	d5381440 	mrs	x0, cpacrmask_el1
.*:	d51c1440 	msr	cptrmask_el2, x0
.*:	d53c1440 	mrs	x0, cptrmask_el2
.*:	d51d1440 	msr	cpacrmask_el12, x0
.*:	d53d1440 	mrs	x0, cpacrmask_el12
.*:	d5181460 	msr	sctlr2mask_el1, x0
.*:	d5381460 	mrs	x0, sctlr2mask_el1
.*:	d51c1460 	msr	sctlr2mask_el2, x0
.*:	d53c1460 	mrs	x0, sctlr2mask_el2
.*:	d51d1460 	msr	sctlr2mask_el12, x0
.*:	d53d1460 	mrs	x0, sctlr2mask_el12
.*:	d5181480 	msr	cpacralias_el1, x0
.*:	d5381480 	mrs	x0, cpacralias_el1
.*:	d51814c0 	msr	sctlralias_el1, x0
.*:	d53814c0 	mrs	x0, sctlralias_el1
.*:	d51814e0 	msr	sctlr2alias_el1, x0
.*:	d53814e0 	mrs	x0, sctlr2alias_el1
.*:	d5182740 	msr	tcrmask_el1, x0
.*:	d5382740 	mrs	x0, tcrmask_el1
.*:	d51c2740 	msr	tcrmask_el2, x0
.*:	d53c2740 	mrs	x0, tcrmask_el2
.*:	d51d2740 	msr	tcrmask_el12, x0
.*:	d53d2740 	mrs	x0, tcrmask_el12
.*:	d5182760 	msr	tcr2mask_el1, x0
.*:	d5382760 	mrs	x0, tcr2mask_el1
.*:	d51c2760 	msr	tcr2mask_el2, x0
.*:	d53c2760 	mrs	x0, tcr2mask_el2
.*:	d51d2760 	msr	tcr2mask_el12, x0
.*:	d53d2760 	mrs	x0, tcr2mask_el12
.*:	d51827c0 	msr	tcralias_el1, x0
.*:	d53827c0 	mrs	x0, tcralias_el1
.*:	d51827e0 	msr	tcr2alias_el1, x0
.*:	d53827e0 	mrs	x0, tcr2alias_el1
.*:	d5181420 	msr	actlrmask_el1, x0
.*:	d5381420 	mrs	x0, actlrmask_el1
.*:	d51c1420 	msr	actlrmask_el2, x0
.*:	d53c1420 	mrs	x0, actlrmask_el2
.*:	d51d1420 	msr	actlrmask_el12, x0
.*:	d53d1420 	mrs	x0, actlrmask_el12
.*:	d51814a0 	msr	actlralias_el1, x0
.*:	d53814a0 	mrs	x0, actlralias_el1

