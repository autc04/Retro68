	.text
 .macro entry fname
	.global \fname
\fname:
 .endm

 .macro func1 fname, t
	entry \fname
 .macro data1
	.dc.\()\t 0
 .endm
	data1
 .endm

	func1 foo, a
