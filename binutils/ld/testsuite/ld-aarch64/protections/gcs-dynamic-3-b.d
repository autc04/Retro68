#name: '-z gcs=implicit -z gcs-report-dynamic=warning' with GCS-unmarked shared libraries reports warnings.
#source: gcs.s
#source: gcs2.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs  -defsym __property_gcs__=1
#ld: -z gcs=implicit -z gcs-report-dynamic=warning -L./tmpdir -lnogcs-so -lbti-plt-so -lgcs-so2
#warning: \A[^\n]*libnogcs-so\.so: warning: GCS is required by -z gcs[^\n]*\n
#warning:   [^\n]*libbti-plt-so\.so: warning: GCS is required by -z gcs[^\n]*
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: GCS
