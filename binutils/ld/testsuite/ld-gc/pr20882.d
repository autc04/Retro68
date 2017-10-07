#name: --gc-sections with relocations in debug section
#source: pr20882a.s
#source: pr20882b.s
#source: pr20882c.s
#ld: --gc-sections -e main
#readelf: -x .debug_info

#...
  0x0+ (0a000000 00000000 |00000000 0000000a |06000000 |00000006 |0400|0004)28 .*
