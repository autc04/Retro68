#as: -menable-sysreg-checking -I$srcdir/$subdir -march=armv8-a+tlbid
#as: -I$srcdir/$subdir -march=armv8-a+tlbid
#objdump: -dr
[^:]+:     file format .*



[^:]+:

[^:]+:
.*:	d538a4c0 	mrs	x0, tlbididr_el1
.*:	d51c2800 	msr	vtlbid0_el2, x0
.*:	d53c2800 	mrs	x0, vtlbid0_el2
.*:	d51c2820 	msr	vtlbid1_el2, x0
.*:	d53c2820 	mrs	x0, vtlbid1_el2
.*:	d51c2840 	msr	vtlbid2_el2, x0
.*:	d53c2840 	mrs	x0, vtlbid2_el2
.*:	d51c2860 	msr	vtlbid3_el2, x0
.*:	d53c2860 	mrs	x0, vtlbid3_el2
.*:	d51c2900 	msr	vtlbidos0_el2, x0
.*:	d53c2900 	mrs	x0, vtlbidos0_el2
.*:	d51c2920 	msr	vtlbidos1_el2, x0
.*:	d53c2920 	mrs	x0, vtlbidos1_el2
.*:	d51c2940 	msr	vtlbidos2_el2, x0
.*:	d53c2940 	mrs	x0, vtlbidos2_el2
.*:	d51c2960 	msr	vtlbidos3_el2, x0
.*:	d53c2960 	mrs	x0, vtlbidos3_el2
