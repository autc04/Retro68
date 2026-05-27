# name: EABI build attributes: all files with Tag_Feature_GCS=0x1 means that output also has Tag_Feature_GCS=0x1
# source: ba-aarch64-1-gcs-1.s
# source: ba-aarch64-1-gcs-2.s
# as:
# ld: -shared
# readelf: --arch-specific --notes

Displaying notes found in: \.note\.gnu\.property
  Owner                Data size 	Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties:[	 ]+AArch64 feature: GCS
Subsections:
 - Name:[	 ]+aeabi_feature_and_bits
   Scope:[	 ]+public
   Length:[	 ]+31
   Comprehension:[	 ]+optional
   Encoding:[	 ]+ULEB128
   Values:
 +Tag_Feature_GCS:[	 ]+1 .*
