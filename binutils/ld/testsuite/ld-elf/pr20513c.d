#source: pr20513a.s
#source: pr20513b.s
#ld: -shared
#readelf: -S --wide
#target: *-*-linux* *-*-gnu*

#failif
#...
[ 	]*\[.*\][ 	]+\..text\.exclude[ 	]+.*
#...
