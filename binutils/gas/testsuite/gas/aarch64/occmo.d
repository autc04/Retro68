#name: FEAT_OCCMO Test
#as: -march=armv8-a+occmo
#as: -march=armv9.6-a
#objdump: -dr

.*:     file format .*

Disassembly of section .text:

0+ <.*>:
[^:]*:	d50b7b00 	dc	cvaoc, x0
[^:]*:	d50b7b1f 	dc	cvaoc, xzr
[^:]*:	d50b7f00 	dc	civaoc, x0
[^:]*:	d50b7f1f 	dc	civaoc, xzr
