# name: Build attributes: unknown subsections are removed from the output.
# source: ba-2-mix-unknown-and-known-subsections-1.s
# source: ba-2-mix-unknown-and-known-subsections-2.s
# as:
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

 - Name:[	 ]+gnu_testing_ba_2_MERGE_ADD
   Scope:[	 ]+private
   Length:[	 ]+55
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_0:[	 ]+"hello\+foo"
 +Tag_unknown_1:[	 ]+"world\+bar"
