	.section .XXX.attributes, "", %0x70000003
	# Format version
	.byte 'A'
	# Size
	.4byte (.Lend_attrs - .)
	# "Vendor"
	.asciz "aeabi"
	# File scope
	.byte 1
	# Size
	.4byte (.Lend_attrs - . + 1)
	.uleb128 4
	.byte 'a', 'b', 'c'
.Lend_attrs:
