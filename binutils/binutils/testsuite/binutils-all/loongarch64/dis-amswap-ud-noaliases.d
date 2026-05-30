#name: Check correct disassembly of ud orig instructions
#source: dis-amswap-ud.s
#objdump: -d -M numeric,no-aliases

#...
Disassembly of section \.text:

0+ <ud>:
   0:	38600400 	amswap.w    	\$r0, \$r1, \$r0
   4:	38600421 	amswap.w    	\$r1, \$r1, \$r1
   8:	38600442 	amswap.w    	\$r2, \$r1, \$r2
   c:	38600463 	amswap.w    	\$r3, \$r1, \$r3

0+10 <amswap_w>:
  10:	38600084 	amswap.w    	\$r4, \$r0, \$r4
  14:	386008a5 	amswap.w    	\$r5, \$r2, \$r5
  18:	386004e6 	amswap.w    	\$r6, \$r1, \$r7
  1c:	38600528 	amswap.w    	\$r8, \$r1, \$r9
