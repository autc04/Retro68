# name: Object Attributes v2: 2 files, all optional, 1 more, 1 missing
# target: [supports_oa_v2]
# source: oav2-1-all-optional-1.s
# source: oav2-1-all-optional-2.s
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
 +Tag_unknown_1:[	 ]+0 .*

 - Name:[	 ]+gnu_testing_ba_2_MERGE_AND
   Scope:[	 ]+private
   Length:[	 ]+37
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_0:[	 ]+0 .*
 +Tag_unknown_1:[	 ]+1 .*

 - Name:[	 ]+gnu_testing_ba_3_MERGE_ADD
   Scope:[	 ]+private
   Length:[	 ]+47
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_0:[	 ]+"hello"
 +Tag_unknown_1:[	 ]+"world"

 - Name:[	 ]+gnu_testing_ba_4_MERGE_ADD
   Scope:[	 ]+private
   Length:[	 ]+43
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_0:[	 ]+"foo"
 +Tag_unknown_1:[	 ]+"bar"

 - Name:[	 ]+gnu_testing_ba_5_MERGE_ADD
   Scope:[	 ]+private
   Length:[	 ]+55
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_0:[	 ]+"hello\+foo"
 +Tag_unknown_1:[	 ]+"world\+bar"

