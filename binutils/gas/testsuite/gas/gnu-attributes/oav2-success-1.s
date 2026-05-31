	.set ATTR_TYPE_uleb128,   0
	.set ATTR_TYPE_asciz,     1

	.set SUBSEC_required,     0
	.set SUBSEC_optional,     1

	.gnu_subsection foo_1, 1, ATTR_TYPE_uleb128

	.set Tag_Feature_foo,     2
	.set Tag_Feature_bar,     3

	.gnu_attribute  Tag_Feature_bar, 1
	.gnu_attribute  0, 1
	.gnu_attribute  1, 1
	.gnu_attribute  Tag_Feature_foo, 1
	.gnu_attribute  0xa, (0xff + ~0xfc) // 255 - 253 = 2

	.gnu_subsection gnu_foo_1, 1, ATTR_TYPE_uleb128
	.gnu_attribute  Tag_Feature_bar, 1
	.gnu_attribute  Tag_Feature_foo, 'A'

	.gnu_subsection gnu_foo_2, 0, ATTR_TYPE_asciz
	.gnu_attribute  4, ""
	.gnu_attribute  2, "TEST2"

	.gnu_subsection gnu_foo_3, required, ntbs
	.gnu_attribute  4, "TEST"

	.gnu_subsection gnu_testing_foo_MERGE_AND, optional, ULEB128
	.gnu_attribute  GNUTestTag_0, 0
	.gnu_attribute  GNUTestTag_1, 1
	.gnu_attribute  2, 1
