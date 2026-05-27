#objdump: -Wf -d -M no-aliases
#skip: loongarch32-*-*

.*:     file format .*

Contents of the .eh_frame section:
#...
00000014 0000000000000020 00000018 FDE cie=00000000 pc=0000000000000000..0000000000000020
  DW_CFA_advance_loc: 4 to 0000000000000004
#...

Disassembly of section .text:

0+0 <_start>:
   0:	02ffc063 	addi.d      	\$sp, \$sp, -16
   4:	29c02076 	st.d        	\$fp, \$sp, 8
   8:	02c04076 	addi.d      	\$fp, \$sp, 16
   c:	0015000c 	or          	\$t0, \$zero, \$zero
  10:	00150184 	or          	\$a0, \$t0, \$zero
  14:	28c02076 	ld.d        	\$fp, \$sp, 8
  18:	02c04063 	addi.d      	\$sp, \$sp, 16
  1c:	4c000020 	jirl        	\$zero, \$ra, 0
