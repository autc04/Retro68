# name: EABI build attributes: some files missing Tag_Feature_GCS, but -z gcs=always means that GCS is required.
# source: ba-aarch64-1-gcs-1.s
# source: ba-aarch64-1-void.s
# source: ba-aarch64-1-gcs-via-gnu-props.s
# source: ba-aarch64-1-gcs-2.s
# as: -defsym __property_gcs__=1
# ld: -shared -z gcs=always -z gcs-report=warning
#warning: .*ba-aarch64-1-void\.o: warning: GCS is required by -z gcs.*
# readelf: --arch-specific --notes

Displaying notes found in: \.note\.gnu\.property
  Owner                Data size 	Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties:[	 ]+AArch64 feature: GCS
Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+35
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_BTI:[	 ]+0 .*
 +Tag_Feature_PAC:[	 ]+0 .*
 +Tag_Feature_GCS:[	 ]+1 .*
