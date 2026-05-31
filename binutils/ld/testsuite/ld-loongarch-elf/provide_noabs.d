#source: provide_sym.s
#as:
#ld: -T provide_noabs.ld
#objdump: -d

.*: +file format .*


#...
   0:	58001085 	beq         	\$a0, \$a1, 16	# 10 <fun1>
   4:	40000c80 	beqz        	\$a0, 12	# 10 <fun1>
   8:	54000800 	bl          	8	# 10 <fun1>
#pass
