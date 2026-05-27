#name: No GCS option (equivalent to -z gcs=implicit) and empty GNU note property in input emits no GCS attribute [shared]
#source: gcs.s
#source: gcs2.s
#alltargets: [check_shared_lib_support] *linux*
#as: -march=armv9.4-a+gcs
#ld: -shared
#readelf: -n

# Expect no GNU section at all, so readelf output should be empty.