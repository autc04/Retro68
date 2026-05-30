#as: -menable-sysreg-checking -march=armv8-a+mpamv2 -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
.*:	d51ca700 	msr	mpamvidcr_el2, x0
.*:	d53ca700 	mrs	x0, mpamvidcr_el2
.*:	d51ca720 	msr	mpamvidsr_el2, x0
.*:	d53ca720 	mrs	x0, mpamvidsr_el2
.*:	d51ea720 	msr	mpamvidsr_el3, x0
.*:	d53ea720 	mrs	x0, mpamvidsr_el3
