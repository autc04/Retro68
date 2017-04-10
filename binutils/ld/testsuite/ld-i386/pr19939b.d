#source: pr19939.s
#as: --32
#ld: -melf_i386 -shared
#readelf: -d --wide

#...
.*\(TEXTREL\).*
#pass
