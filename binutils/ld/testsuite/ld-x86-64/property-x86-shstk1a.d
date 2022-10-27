#source: property-x86-empty.s
#source: property-x86-shstk.s
#as: --64 -defsym __64_bit__=1
#ld: -r -melf_x86_64
#readelf: -n

