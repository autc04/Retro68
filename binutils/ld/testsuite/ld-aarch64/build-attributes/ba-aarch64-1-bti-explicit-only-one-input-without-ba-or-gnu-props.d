# name: EABI build attributes: a input object without build attributes or GNU properties, but -z force-bti means that the output has Tag_Feature_BTI=0x1
# source: ba-aarch64-1-void.s
# as:
# ld: -shared -T bti-plt.ld -z force-bti -z bti-report=warning
#warning: .*ba-aarch64-1-void\.o: warning: BTI is required by -z force-bti.*
# readelf: --arch-specific --notes

Displaying notes found in: \.note\.gnu\.property
  Owner                Data size 	Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties:[	 ]+AArch64 feature: BTI
Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+31
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+1 .*
