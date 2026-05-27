.set ATTR_TYPE_uleb128,   0
.set ATTR_TYPE_asciz,     1

.set SUBSEC_required,     0
.set SUBSEC_optional,     1

.aeabi_subsection foo_1, 1, ATTR_TYPE_uleb128

.set Tag_Feature_foo,     2
.set Tag_Feature_bar,     3

.aeabi_attribute  Tag_Feature_bar, 1
.aeabi_attribute  0, 1
.aeabi_attribute  1, 1
.aeabi_attribute  Tag_Feature_foo, 1
.aeabi_attribute  0xa, (0xff + ~0xfc) // 255 - 253 = 2

.aeabi_subsection aeabi_foo_1, 1, ATTR_TYPE_uleb128
.aeabi_attribute  Tag_Feature_bar, 1
.aeabi_attribute  Tag_Feature_foo, 'A'

.aeabi_subsection aeabi_foo_2, 0, ATTR_TYPE_asciz
.aeabi_attribute  4, ""
.aeabi_attribute  2, "TEST2"

.aeabi_subsection aeabi_foo_3, required, ntbs
.aeabi_attribute  4, "TEST"

.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
.aeabi_attribute  Tag_Feature_BTI, 1
.aeabi_attribute  Tag_Feature_GCS, 1
.aeabi_attribute  Tag_Feature_PAC, 1
