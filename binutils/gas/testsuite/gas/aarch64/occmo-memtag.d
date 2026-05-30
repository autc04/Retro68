#name: FEAT_OCCMO + MEMTAG Test
#as: -march=armv8-a+occmo+memtag
#as: -march=armv9.6-a+memtag
#objdump: -dr

.*:     file format .*

Disassembly of section .text:

0+ <.*>:
[^:]*:	d50b7be0 	dc	cgdvaoc, x0
[^:]*:	d50b7bff 	dc	cgdvaoc, xzr
[^:]*:	d50b7fe0 	dc	cigdvaoc, x0
[^:]*:	d50b7fff 	dc	cigdvaoc, xzr
