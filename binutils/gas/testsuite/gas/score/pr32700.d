#as:
#objdump: -dr
#source: pr32700.s

.*: +file format .*

Disassembly of section \.text:

0+ <\.text>:
   0:	94388000 	ldis		r1, 0x0\(0\)
			0: R_SCORE_HI16	dwarf_reg_size_table
   4:	84348000 	ori		r1, 0x0
			4: R_SCORE_LO16	dwarf_reg_size_table
   8:	d8e18000 	lbu		r7, \[r1, 0\]
