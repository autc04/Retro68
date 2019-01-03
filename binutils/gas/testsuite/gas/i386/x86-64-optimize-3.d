#as: -Os
#objdump: -drw
#name: x86-64 optimized encoding 3 with -Os

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
 +[a-f0-9]+:	a8 7f                	test   \$0x7f,%al
 +[a-f0-9]+:	a8 7f                	test   \$0x7f,%al
 +[a-f0-9]+:	a8 7f                	test   \$0x7f,%al
 +[a-f0-9]+:	a8 7f                	test   \$0x7f,%al
 +[a-f0-9]+:	f6 c3 7f             	test   \$0x7f,%bl
 +[a-f0-9]+:	f6 c3 7f             	test   \$0x7f,%bl
 +[a-f0-9]+:	f6 c3 7f             	test   \$0x7f,%bl
 +[a-f0-9]+:	f6 c3 7f             	test   \$0x7f,%bl
 +[a-f0-9]+:	40 f6 c7 7f          	test   \$0x7f,%dil
 +[a-f0-9]+:	40 f6 c7 7f          	test   \$0x7f,%dil
 +[a-f0-9]+:	40 f6 c7 7f          	test   \$0x7f,%dil
 +[a-f0-9]+:	40 f6 c7 7f          	test   \$0x7f,%dil
 +[a-f0-9]+:	41 f6 c1 7f          	test   \$0x7f,%r9b
 +[a-f0-9]+:	41 f6 c1 7f          	test   \$0x7f,%r9b
 +[a-f0-9]+:	41 f6 c1 7f          	test   \$0x7f,%r9b
 +[a-f0-9]+:	41 f6 c1 7f          	test   \$0x7f,%r9b
#pass
