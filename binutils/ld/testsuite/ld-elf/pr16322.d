#ld: -shared -z relro -z noseparate-code
#readelf: -l --wide
#target: *-*-linux-gnu *-*-gnu* *-*-nacl* arm*-*-uclinuxfdpiceabi

#...
  GNU_RELRO .*
#pass
