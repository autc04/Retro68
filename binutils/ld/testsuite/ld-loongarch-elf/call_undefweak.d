#...
[0-9a-f]+ <main>:
   +[0-9a-f]+:	4c000000 	jr          	\$zero
   +[0-9a-f]+:	........ 	b           	.*	# [0-9a-f]+ <fn2@plt>
   +[0-9a-f]+:	4c000001 	jirl        	\$ra, \$zero, 0
   +[0-9a-f]+:	........ 	bl          	.*	# [0-9a-f]+ <fn2@plt>

[0-9a-f]+ <medium_call_nop>:
   +[0-9a-f]+:	1e000001 	pcaddu18i   	\$ra, 0
   +[0-9a-f]+:	4c000001 	jirl        	\$ra, \$zero, 0
   +[0-9a-f]+:	1e000001 	pcaddu18i   	\$ra, 0
   +[0-9a-f]+:	........ 	jirl        	\$ra, \$ra, .*
   +[0-9a-f]+:	1e00000c 	pcaddu18i   	\$t0, 0
   +[0-9a-f]+:	4c000000 	jr          	\$zero
   +[0-9a-f]+:	1e00000c 	pcaddu18i   	\$t0, 0
   +[0-9a-f]+:	........ 	jirl        	\$zero, \$t0, .*
