#name: '-z gcs=implicit -z gcs-report-dynamic=error' with GCS-unmarked shared libraries reports errors.
#source: gcs.s
#source: gcs2.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs  -defsym __property_gcs__=1
#ld: -z gcs=implicit -z gcs-report-dynamic=error -L./tmpdir -lnogcs-so -lbti-plt-so -lgcs-so2
#error: \A[^\n]*libnogcs-so\.so: error: GCS is required by -z gcs[^\n]*\n
#error:   [^\n]*libbti-plt-so\.so: error: GCS is required by -z gcs[^\n]*
