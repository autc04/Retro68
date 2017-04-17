#source: tls_gd-01.s
#as: -mcpu=arc700
#ld: -shared
#objdump: -d
#xfail: arc*-*-elf*

[^:]+:     file format elf32-littlearc


Disassembly of section \.text:

[0-9a-f]+ <__start>:
 [0-9a-f]+:	2700 7f80 0000 2080 	add	r0,pcl,0x2080
 [0-9a-f]+:	2700 7f80 0000 2080 	add	r0,pcl,0x2080
