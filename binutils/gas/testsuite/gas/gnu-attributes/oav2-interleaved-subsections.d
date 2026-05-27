# name: GNU attributes v2: correct context switching between interleaved subsections
# target: [supports_oa_v2]
# readelf: -A

Subsections:
 - Name:[	 ]+foo_1
   Scope:[	 ]+private
   Length:[	 ]+20
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_1:[	 ]+1 .*
 +Tag_unknown_2:[	 ]+0 .*
 +Tag_unknown_3:[	 ]+0 .*
 +Tag_unknown_4:[	 ]+0 .*

 - Name:[	 ]+gnu_abi
   Scope:[	 ]+public
   Length:[	 ]+18
   Comprehension:[	 ]+required
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_1:[	 ]+1 .*
 +Tag_unknown_2:[	 ]+1 .*

 - Name:[	 ]+gnu_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+33
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_0:[	 ]+1 .*
 +Tag_unknown_1:[	 ]+0 .*
 +Tag_unknown_2:[	 ]+1 .*
