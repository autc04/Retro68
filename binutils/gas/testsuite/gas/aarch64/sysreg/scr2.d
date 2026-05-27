#as: -menable-sysreg-checking -march=armv9.3-a -I$srcdir/$subdir
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
.*:	d51e1240 	msr	scr2_el3, x0
.*:	d53e1240 	mrs	x0, scr2_el3
