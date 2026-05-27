#name: Copy AEABI build attributes from an object to another.
#PROG: objcopy
#source: build-attributes.s
#readelf: -A

Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+35
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+1 .*
 +Tag_Feature_PAC:[	 ]+0 .*
 +Tag_Feature_GCS:[	 ]+1 .*

 - Name:[	 ]+aeabi_pauthabi
   Scope:[	 ]+public
   Length:[	 ]+23
   Comprehension:[	 ]+required
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_PAuth_Schema:[	 ]+1 .*

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

 - Name:[	 ]+foo_2
   Scope:[	 ]+private
   Length:[	 ]+16
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_0:[	 ]+1 .*
 +Tag_unknown_1:[	 ]+1 .*

 - Name:[	 ]+foo_3
   Scope:[	 ]+private
   Length:[	 ]+26
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:
 +Tag_unknown_0:[	 ]+"hello"
 +Tag_unknown_1:[	 ]+"world"
