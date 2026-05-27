# name: EABI build attributes: '-z pac-plt' with some files without Tag_Feature_PAC=0x1 does not set Tag_Feature_PAC=0x1.
# source: ba-aarch64-1-pac-1.s
# source: ba-aarch64-1-void.s
# source: ba-aarch64-1-pac-2.s
# as: -defsym __property_pac__=1
# ld: -shared  -T bti-plt.ld -z pac-plt
# readelf: --arch-specific --notes

Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+35
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+0 .*
 +Tag_Feature_PAC:[	 ]+0 .*
 +Tag_Feature_GCS:[	 ]+0 .*
