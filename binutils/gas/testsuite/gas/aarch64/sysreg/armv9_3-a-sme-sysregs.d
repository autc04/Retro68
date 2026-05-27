#as: -march=armv9.3-a+sme
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
.*:	d538a5e0 	mrs	x0, mpambwsm_el1
.*:	d518a5e0 	msr	mpambwsm_el1, x0
