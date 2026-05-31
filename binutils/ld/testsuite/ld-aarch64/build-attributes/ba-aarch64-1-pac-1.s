.aeabi_subsection aeabi_feature_and_bits, optional, uleb128
.aeabi_attribute  Tag_Feature_PAC, 1

	.text
	.globl _start
	.type _start,@function
_start:
	bl foo
	bl bar