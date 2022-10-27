#source: pr19939.s
#as: --64
#ld: -melf_x86_64 -shared
#readelf: -d --wide

#...
.*\(TEXTREL\).*
#pass
