#as: -I$srcdir/$subdir
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	d5380080 	mrs	x0, mpuir_el1
.*:	d51d5100 	msr	afsr0_el12, x0
.*:	d53d5100 	mrs	x0, afsr0_el12
.*:	d5184280 	msr	uao, x0
.*:	d5384280 	mrs	x0, uao
.*:	d5182220 	msr	apdakeyhi_el1, x0
.*:	d5382220 	mrs	x0, apdakeyhi_el1
.*:	d53bd220 	mrs	x0, amcfgr_el0
.*:	d51c2600 	msr	vsttbr_el2, x0
.*:	d53c2600 	mrs	x0, vsttbr_el2
.*:	d51bd0e0 	msr	scxtnum_el0, x0
.*:	d53bd0e0 	mrs	x0, scxtnum_el0
.*:	d5380380 	mrs	x0, id_pfr2_el1
.*:	d53bd2c0 	mrs	x0, amcg1idr_el0
.*:	d51c1240 	msr	hcrx_el2, x0
.*:	d53c1240 	mrs	x0, hcrx_el2
.*:	d5184300 	msr	allint, x0
.*:	d5384300 	mrs	x0, allint
.*:	d51860a0 	msr	pfar_el1, x0
.*:	d53860a0 	mrs	x0, pfar_el1
.*:	d518a260 	msr	pir_el1, x0
.*:	d538a260 	mrs	x0, pir_el1
.*:	d5189ea0 	msr	pmecr_el1, x0
.*:	d5389ea0 	mrs	x0, pmecr_el1
.*:	d51c3100 	msr	hdfgrtr2_el2, x0
.*:	d53c3100 	mrs	x0, hdfgrtr2_el2
.*:	d5100440 	msr	mdselr_el1, x0
.*:	d5300440 	mrs	x0, mdselr_el1
.*:	d51b9600 	msr	pmicfiltr_el0, x0
.*:	d53b9600 	mrs	x0, pmicfiltr_el0
.*:	d5189a80 	msr	pmsdsfr_el1, x0
.*:	d5389a80 	mrs	x0, pmsdsfr_el1
.*:	d5189e80 	msr	pmuacr_el1, x0
.*:	d5389e80 	mrs	x0, pmuacr_el1
.*:	d51ba280 	msr	por_el0, x0
.*:	d53ba280 	mrs	x0, por_el0
.*:	d51ca2a0 	msr	s2pir_el2, x0
.*:	d53ca2a0 	mrs	x0, s2pir_el2
.*:	d518a2a0 	msr	s2por_el1, x0
.*:	d538a2a0 	mrs	x0, s2por_el1
.*:	d5181060 	msr	sctlr2_el1, x0
.*:	d5381060 	mrs	x0, sctlr2_el1
.*:	d5109d60 	msr	spmaccessr_el1, x0
.*:	d5309d60 	mrs	x0, spmaccessr_el1
.*:	d5182060 	msr	tcr2_el1, x0
.*:	d5382060 	mrs	x0, tcr2_el1
.*:	d518a320 	msr	amair2_el1, x0
.*:	d538a320 	mrs	x0, amair2_el1
.*:	d530ebe0 	mrs	x0, pmccntsvr_el1
.*:	d51ec120 	msr	vdisr_el3, x0
.*:	d53ec120 	mrs	x0, vdisr_el3
.*:	d5139c80 	msr	spmzr_el0, x0
.*:	d5100540 	msr	mdstepop_el1, x0
.*:	d5300540 	mrs	x0, mdstepop_el1
.*:	d51e21a0 	msr	gpcbw_el3, x0
.*:	d53e21a0 	mrs	x0, gpcbw_el3
.*:	d5189aa0 	msr	pmbmar_el1, x0
.*:	d5389aa0 	mrs	x0, pmbmar_el1
.*:	d5385340 	mrs	x0, erxgsr_el1
.*:	d51b4440 	msr	fpmr, x0
.*:	d53b4440 	mrs	x0, fpmr
.*:	d5380480 	mrs	x0, id_aa64zfr0_el1
.*:	d518a460 	msr	lorc_el1, x0
.*:	d538a460 	mrs	x0, lorc_el1
.*:	d5389ae0 	mrs	x0, pmbidr_el1
.*:	d51b2520 	msr	gcspr_el0, x0
.*:	d53b2520 	mrs	x0, gcspr_el0
.*:	d53804a0 	mrs	x0, id_aa64smfr0_el1
.*:	d5181260 	msr	trcitecr_el1, x0
.*:	d5381260 	mrs	x0, trcitecr_el1
.*:	d51810c0 	msr	gcr_el1, x0
.*:	d53810c0 	mrs	x0, gcr_el1
.*:	d53b2400 	mrs	x0, rndr
.*:	d518c120 	msr	disr_el1, x0
.*:	d538c120 	mrs	x0, disr_el1
.*:	d5184260 	msr	pan, x0
.*:	d5384260 	mrs	x0, pan
.*:	d51b42c0 	msr	ssbs, x0
.*:	d53b42c0 	mrs	x0, ssbs
.*:	d519c000 	msr	icc_apr_el1, x0
.*:	d539c000 	mrs	x0, icc_apr_el1
.*:	d558d0c2 	msrr	rcwmask_el1, x2, x3
.*:	d578d0c2 	mrrs	x2, x3, rcwmask_el1
.*:	d55c2002 	msrr	ttbr0_el2, x2, x3
.*:	d57c2002 	mrrs	x2, x3, ttbr0_el2
.*:	d55c2022 	msrr	ttbr1_el2, x2, x3
.*:	d57c2022 	mrrs	x2, x3, ttbr1_el2
