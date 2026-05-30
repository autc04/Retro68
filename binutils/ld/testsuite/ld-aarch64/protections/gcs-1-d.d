#name: '-z gcs' without value raises an error
#source: gcs.s
#source: gcs2.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs -defsym __property_gcs__=1
#ld: -shared -z gcs
#error: .*: error: unrecognized value '-z gcs'
