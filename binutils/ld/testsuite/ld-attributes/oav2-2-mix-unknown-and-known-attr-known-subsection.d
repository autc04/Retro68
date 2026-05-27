# name: Object Attributes v2: unknown attribute inside known subsection should be removed from the output.
# target: [supports_oa_v2]
# source: oav2-2-mix-unknown-and-known-attr-known-subsection-1.s
# source: oav2-2-mix-unknown-and-known-attr-known-subsection-2.s
# ld: -shared
# readelf: --arch-specific

Subsections:
 - Name:[	 ]+gnu_testing_ba_1_MERGE_AND
   Scope:[	 ]+private
   Length:[	 ]+37
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_0:[	 ]+1 .*
 +Tag_unknown_1:[	 ]+1 .*

 - Name:[	 ]+gnu_testing_ba_2_MERGE_ADD
   Scope:[	 ]+private
   Length:[	 ]+51
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_0:[	 ]+"foo\+foo"
 +Tag_unknown_1:[	 ]+"bar\+bar"
