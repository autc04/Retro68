 .macro function name
 .macro endfunction
 .endm
	.text
	.global \name
\name:
 .endm

	function foo
	.dc.a 0
	endfunction
