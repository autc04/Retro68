#name: Check correct disassembly of ud
#source: dis-amswap-ud.s
#objdump: -d -M numeric

#...
Disassembly of section \.text:

0+ <ud>:
   0:	38600400 	ud          	0x0
   4:	38600421 	ud          	0x1
   8:	38600442 	ud          	0x2
   c:	38600463 	ud          	0x3

0+10 <amswap_w>:
  10:	38600084 	amswap.w    	\$r4, \$r0, \$r4
  14:	386008a5 	amswap.w    	\$r5, \$r2, \$r5
  18:	386004e6 	amswap.w    	\$r6, \$r1, \$r7
  1c:	38600528 	amswap.w    	\$r8, \$r1, \$r9
