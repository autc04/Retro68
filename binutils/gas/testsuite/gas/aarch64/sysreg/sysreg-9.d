#source: sysreg-9.s
#as: -menable-sysreg-checking -I$srcdir/$subdir
#objdump: -dr


[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	d5189aa0 	msr	pmbmar_el1, x0
.*:	d5389aa0 	mrs	x0, pmbmar_el1
.*:	d51d9a60 	msr	pmbsr_el12, x0
.*:	d53d9a60 	mrs	x0, pmbsr_el12
.*:	d51c9a60 	msr	pmbsr_el2, x0
.*:	d53c9a60 	mrs	x0, pmbsr_el2
.*:	d51e9a60 	msr	pmbsr_el3, x0
.*:	d53e9a60 	mrs	x0, pmbsr_el3
.*:	d51d9b60 	msr	trbsr_el12, x0
.*:	d53d9b60 	mrs	x0, trbsr_el12
.*:	d51c9b60 	msr	trbsr_el2, x0
.*:	d53c9b60 	mrs	x0, trbsr_el2
.*:	d51e9b60 	msr	trbsr_el3, x0
.*:	d53e9b60 	mrs	x0, trbsr_el3
