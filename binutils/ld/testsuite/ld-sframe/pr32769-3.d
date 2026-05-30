#as: --gsframe-3
#source: pr32769-3.s
#readelf: --sframe
#ld: --gc-sections -e foo
#name: GC Multiple .text sections, keep all

#...
\s+Num FDEs: 2
\s+Num FREs: 3
#...
