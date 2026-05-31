# name: EABI build attributes: combine matching aeabi_pauthabi subsections, and (platform=0x0, schema=0x0) is accepted.
# source: ba-aarch64-1-required-subsection-3.s
# source: ba-aarch64-1-required-subsection-4.s
# as:
# ld: -shared
# readelf: --arch-specific

Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+33
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+1 .*
 +Tag_Feature_PAC:[	 ]+1 .*

 - Name:[	 ]+aeabi_pauthabi
   Scope:[	 ]+public
   Length:[	 ]+25
   Comprehension:[	 ]+required
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_PAuth_Platform:[	 ]+0 .*
 +Tag_PAuth_Schema:[	 ]+0 .*
