# name: GNU attributes v2: dump subsections content from attributes vendor section.
# target: [supports_oa_v2]
# readelf: -A

Subsections:
 - Name:[	 ]+foo_1
   Scope:[	 ]+private
   Length:[	 ]+22
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_0:[	 ]+1 .*
 +Tag_unknown_1:[	 ]+1 .*
 +Tag_unknown_2:[	 ]+1 .*
 +Tag_unknown_3:[	 ]+1 .*
 +Tag_unknown_10:[	 ]+2 .*

 - Name:[	 ]+gnu_foo_1
   Scope:[	 ]+public
   Length:[	 ]+20
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_2:[	 ]+65 .*
 +Tag_unknown_3:[	 ]+1 .*

 - Name:[	 ]+gnu_foo_2
   Scope:[	 ]+public
   Length:[	 ]+25
   Comprehension:[	 ]+required
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_2:[	 ]+"TEST2"
 +Tag_unknown_4:[	 ]+""

 - Name:[	 ]+gnu_foo_3
   Scope:[	 ]+public
   Length:[	 ]+22
   Comprehension:[	 ]+required
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_4:[	 ]+"TEST"

 - Name:[	 ]+gnu_testing_foo_MERGE_AND
   Scope:[	 ]+private
   Length:[	 ]+38
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_0:[	 ]+0 .*
 +Tag_unknown_1:[	 ]+1 .*
 +Tag_unknown_2:[	 ]+1 .*
