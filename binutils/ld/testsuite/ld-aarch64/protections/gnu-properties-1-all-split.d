#name: GNU Property: readelf (single input, combine several GNU prop values)
#source: gnu-properties-maskable.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv8.5-a -defsym __split_gnu_properties__=1
#ld: -shared
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: BTI, PAC, GCS
