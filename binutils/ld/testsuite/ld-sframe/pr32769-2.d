#as: --gsframe-3
#source: pr32769-2.s
#readelf: --sframe
#ld: --gc-sections -shared
#name: GC Multiple .text sections, remove unused

#...
\s+Num FDEs: 1
#...
