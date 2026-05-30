#name: No GCS option (equivalent to -z gcs=implicit) and mixed inputs emits no GCS feature and no warnings [shared]
#source: gcs.s
#source: gcs2.s
#source: nogcs.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs -defsym __property_gcs__=1
#ld: -shared
#readelf: -n
