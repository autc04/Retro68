#as: -menable-sysreg-checking -march=armv8-a+mpamv2 -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
.*:	d518a540 	msr	mpamctl_el1, x0
.*:	d538a540 	mrs	x0, mpamctl_el1
.*:	d51da540 	msr	mpamctl_el12, x0
.*:	d53da540 	mrs	x0, mpamctl_el12
.*:	d51ca540 	msr	mpamctl_el2, x0
.*:	d53ca540 	mrs	x0, mpamctl_el2
.*:	d51ea540 	msr	mpamctl_el3, x0
.*:	d53ea540 	mrs	x0, mpamctl_el3
