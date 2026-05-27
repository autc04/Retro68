#ld: -shared -z relro -z noseparate-code
#readelf: -l --wide
#target: *-*-linux-gnu *-*-gnu* arm*-*-uclinuxfdpiceabi
#xfail: ![check_shared_lib_support] 
#xfail: ![check_relro_support]

#...
  GNU_RELRO .*
#pass
