# name: EABI build attributes: EABI build attributes: some files with build attribute Tag_Feature_BTI=0x1 and others with equivalent GNU property means that output also has Tag_Feature_BTI=0x1
# source: ba-aarch64-1-bti-1.s
# source: ba-aarch64-1-bti-via-gnu-props.s
# source: ba-aarch64-1-bti-2.s
# as: -defsym __property_bti__=1
# ld: -shared -T bti-plt.ld
# readelf: --arch-specific --notes

Displaying notes found in: \.note\.gnu\.property
  Owner                Data size 	Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties:[	 ]+AArch64 feature: BTI
Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+35
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+1 .*
 +Tag_Feature_PAC:[	 ]+0 .*
 +Tag_Feature_GCS:[	 ]+0 .*
