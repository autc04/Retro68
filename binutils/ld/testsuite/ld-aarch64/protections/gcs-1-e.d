#name: Invalid value for '-z gcs' raises an error
#source: gcs.s
#source: gcs2.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs
#ld: -shared -z gcs=foo
#error: .*: error: unrecognized value '-z gcs=foo'
