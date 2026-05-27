#name: '-z gcs=always -z gcs-report=error -z gcs-report-dynamic=none' with GCS-unmarked shared libraries reports nothing.
#source: gcs.s
#source: gcs2.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs  -defsym __property_gcs__=1
#ld: -z gcs=always -z gcs-report=error -z gcs-report-dynamic=none -L./tmpdir -lnogcs-so -lbti-plt-so -lgcs-so2
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: GCS
