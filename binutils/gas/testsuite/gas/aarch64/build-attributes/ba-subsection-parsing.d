# name: EABI build attributes: parsing of subsections
# source: ba-subsection-parsing.s
# as:
# readelf: -A

Subsections:
 - Name:[	 ]+foo_01
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+required
   Encoding:[	 ]+ULEB128
   Values:

 - Name:[	 ]+foo_02
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+required
   Encoding:[	 ]+NTBS
   Values:

 - Name:[	 ]+foo_03
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:

 - Name:[	 ]+foo_04
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:

 - Name:[	 ]+foo_05
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+required
   Encoding:[	 ]+ULEB128
   Values:

 - Name:[	 ]+foo_06
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:

 - Name:[	 ]+foo_07
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:

 - Name:[	 ]+foo_08
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+required
   Encoding:[	 ]+NTBS
   Values:

 - Name:[	 ]+foo_09
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+required
   Encoding:[	 ]+ULEB128
   Values:

 - Name:[	 ]+foo_10
   Scope:[	 ]+private
   Length:[	 ]+13
   Comprehension:[	 ]+optional
   Encoding:[	 ]+NTBS
   Values:
