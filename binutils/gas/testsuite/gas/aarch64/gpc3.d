#name: RME_GPC3 System register
#as: -menable-sysreg-checking -march=armv9.5-a
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
[^:]*:	d53e21a0 	mrs	x0, gpcbw_el3
[^:]*:	d51e21a0 	msr	gpcbw_el3, x0
