#source: sysreg-10.s
#as: -menable-sysreg-checking -march=armv8.8-a -I$srcdir/$subdir
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	d53c31e0 	mrs	x0, hfgitr2_el2
.*:	d51c31e0 	msr	hfgitr2_el2, x0
