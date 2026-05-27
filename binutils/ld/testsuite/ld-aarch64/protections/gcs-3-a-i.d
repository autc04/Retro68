#name: '-z gcs=always -z gcs-report=error' with mixed inputs emits errors [shared]
#source: gcs.s
#source: gcs2.s
#source: nogcs.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs -defsym __property_gcs__=1
#ld: -shared -z gcs=always -z gcs-report=error
#error: \A[^\n]*nogcs\.o: error: GCS is required by -z gcs[^\n]*$
