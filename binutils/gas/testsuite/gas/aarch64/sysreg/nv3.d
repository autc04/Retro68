#name: NV3 System Register
#as: -march=armv9.3-a -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
[^:]*:	d51c1500 	msr	nvhcr_el2, x0
[^:]*:	d53c1500 	mrs	x0, nvhcr_el2
[^:]*:	d51c1520 	msr	nvhcrx_el2, x0
[^:]*:	d53c1520 	mrs	x0, nvhcrx_el2
