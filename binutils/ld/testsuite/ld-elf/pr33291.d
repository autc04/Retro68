#source: pr33291a.s
#source: pr33291b.s
#ld: -shared
#readelf: -S --wide
#xfail: ![check_shared_lib_support]

#...
  \[[ 0-9]+\] \.rodata[ 	]+PROGBITS[ 	]+[0-9a-f]+ [0-9a-f]+ 0+9 00 +A +0 +0 +8
#...
