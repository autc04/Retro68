	.text
 .macro func1
	foo
 .endm

 .macro do_foo
 .macro foo
	.global foo
foo:
	.dc.a 0
 .endm
 .endm
	do_foo
	func1
