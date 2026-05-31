#name: Copy object attributes v2 data from an object to another.
#PROG: objcopy
#target: [supports_oa_v2]
#readelf: -A

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

 - Name:[	 ]+gnu_bar
   Scope:[	 ]+public
   Length:[	 ]+20
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_0:[	 ]+1 .*
 +Tag_unknown_1:[	 ]+0 .*
 +Tag_unknown_2:[	 ]+1 .*

 - Name:[	 ]+gnu_foo
   Scope:[	 ]+public
   Length:[	 ]+16
   Comprehension:[	 ]+required
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_unknown_1:[	 ]+1 .*
