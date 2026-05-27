# name: EABI build attributes: all files with Tag_Feature_PAC=0x1 but no '-z pac-plt' means that output has Tag_Feature_PAC=0x1
# source: ba-aarch64-1-pac-1.s
# source: ba-aarch64-1-pac-2.s
# as: -defsym __property_pac__=1
# ld: -shared -T bti-plt.ld
# readelf: --arch-specific --notes

Displaying notes found in: \.note\.gnu\.property
  Owner                Data size 	Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties:[	 ]+AArch64 feature: PAC
Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+35
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+0 .*
 +Tag_Feature_PAC:[	 ]+1 .*
 +Tag_Feature_GCS:[	 ]+0 .*
