#as: -Os
#objdump: -drw
#name: optimized encoding 2 with -Os

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	a8 7f                	test   \$0x7f,%al
 +[a-f0-9]+:	a8 7f                	test   \$0x7f,%al
 +[a-f0-9]+:	a8 7f                	test   \$0x7f,%al
 +[a-f0-9]+:	f6 c3 7f             	test   \$0x7f,%bl
 +[a-f0-9]+:	f6 c3 7f             	test   \$0x7f,%bl
 +[a-f0-9]+:	f6 c3 7f             	test   \$0x7f,%bl
 +[a-f0-9]+:	f7 c7 7f 00 00 00    	test   \$0x7f,%edi
 +[a-f0-9]+:	66 f7 c7 7f 00       	test   \$0x7f,%di
#pass
