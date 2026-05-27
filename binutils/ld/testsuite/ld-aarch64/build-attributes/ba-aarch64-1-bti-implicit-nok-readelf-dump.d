# name: EABI build attributes: some files missing Tag_Feature_BTI means that the output has Tag_Feature_BTI=0x0
# source: ba-aarch64-1-bti-1.s
# source: ba-aarch64-1-void.s
# source: ba-aarch64-1-bti-2.s
# as:
# ld: -shared -T bti-plt.ld
# readelf: --arch-specific --notes

Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+31
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+0 .*
