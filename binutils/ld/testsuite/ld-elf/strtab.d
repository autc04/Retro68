#ld: -shared
#readelf: -W -x .strtab
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi

#failif
#...
 +0x[0-9 ]+.*\.xxxx\..*
#...
