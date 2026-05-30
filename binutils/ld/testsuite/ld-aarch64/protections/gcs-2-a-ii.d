#name: '-z gcs=always' with GCS-unmarked inputs emits GCS feature with warnings [shared]
#source: gcs.s
#source: gcs2.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs
#ld: -shared -z gcs=always
#warning: \A[^\n]*gcs2\.o: warning: GCS is required by -z gcs[^\n]*\n
#warning:   [^\n]*gcs\.o: warning: GCS is required by -z gcs[^\n]*
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: GCS
