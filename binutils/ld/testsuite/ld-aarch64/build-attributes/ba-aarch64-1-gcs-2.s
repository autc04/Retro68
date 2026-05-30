.aeabi_subsection aeabi_feature_and_bits, optional, uleb128
.aeabi_attribute  Tag_Feature_GCS, 1

	.text
	.globl foo2
	.type foo2,@function
foo2:
	bl foo_2

.ifdef __split_gnu_properties__
.include "gnu-note-properties-selectable-split.inc"
.else
.include "gnu-note-properties-selectable-merged.inc"
.endif
