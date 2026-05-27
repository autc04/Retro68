#ld: -z norelro -pie -e0
#objdump: -d

.*:     file format .*


Disassembly of section sec1:

[0-9a-f]+ <_start>:
 [0-9a-f]+:	[0-9a-f]+ 	pcalau12i   	\$a0, .*
 [0-9a-f]+:	[0-9a-f]+ 	ld.d        	\$a0, \$a0, .*
 [0-9a-f]+:	[0-9a-f]+ 	pcalau12i   	\$a0, .*
 [0-9a-f]+:	[0-9a-f]+ 	ld.d        	\$a0, \$a0, .*
