#as: -mla-global-with-abs
#ld: --no-relax -e0
#objdump: -dr
#skip: loongarch32-*-*

.*:     file format .*


Disassembly of section .text:

0+120000100 <.*>:
   120000100:	........ 	lu12i.w     	\$a0, .*
   120000104:	........ 	ori         	\$a0, \$a0, .*
   120000108:	........ 	lu32i.d     	\$a0, .*
   12000010c:	03000084 	lu52i.d     	\$a0, \$a0, 0
   120000110:	28c00081 	ld.d        	\$ra, \$a0, 0
   120000114:	4c000021 	jirl        	\$ra, \$ra, 0
   120000118:	........ 	lu12i.w     	\$a0, .*
   12000011c:	........ 	ori         	\$a0, \$a0, .*
   120000120:	........ 	lu32i.d     	\$a0, .*
   120000124:	03000084 	lu52i.d     	\$a0, \$a0, 0
   120000128:	28c00081 	ld.d        	\$ra, \$a0, 0
   12000012c:	4c000021 	jirl        	\$ra, \$ra, 0
