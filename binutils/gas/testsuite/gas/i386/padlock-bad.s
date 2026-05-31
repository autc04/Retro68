# VIA Nehemiah PadLock instructions w/ (problematic) prefixes

	.text
foo:
	xstore
	rep xstore
	repe xstore
	repne xstore

	data16 xstore

	xsha1
	rep xsha1
	repe xsha1
	repne xsha1

	data16 xsha1
