#source: compress1.s
#as: --compress-debug-sections=zlib-gabi
#ld: -e func_cu2
#readelf: -t
#xfail: alpha-*-*ecoff
# PR ld/25802
#xfail: sparcv9-*-solaris2*

#failif
#...
  .*COMPRESSED.*
#...
