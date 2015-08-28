#source: linkinfo1.s
#ld: -shared
#readelf: -SW
#target: x86_64-* i?86-*

#...
  \[[ 0-9]+\] \.rel[a]?\.plt[ \t]+REL[A]?[ \t][ \t0-9a-f]+AI[ \t0-9a-f]+
#pass
