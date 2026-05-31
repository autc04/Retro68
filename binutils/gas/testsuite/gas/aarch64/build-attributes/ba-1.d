# name: EABI build attributes: several subsections into .ARM.attributes
# source: ba-1.s
# as:
# readelf: -A

Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+35
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+1 .*
 +Tag_Feature_PAC:[	 ]+1 .*
 +Tag_Feature_GCS:[	 ]+1 .*

 - Name:[	 ]+aeabi_foo_1
   Scope:[	 ]+public
   Length:[	 ]+22
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_2:[	 ]+65 .*
 +Tag_unknown_3:[	 ]+1 .*

 - Name:[	 ]+aeabi_foo_2
   Scope:[	 ]+public
   Length:[	 ]+27
   Comprehension:[	 ]+required
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_2:[	 ]+"TEST2"
    Tag_unknown_4:[	 ]+""

 - Name:[	 ]+aeabi_foo_3
   Scope:[	 ]+public
   Length:[	 ]+24
   Comprehension:[	 ]+required
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_4:[	 ]+"TEST"

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
