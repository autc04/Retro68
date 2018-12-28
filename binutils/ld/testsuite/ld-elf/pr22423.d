#source: start.s
#readelf: -l -W
#ld: -pie
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi

#...
 +PHDR +0x[0-9a-f]+ +0x[0-9a-f]+ +0x[0-9a-f]+ +0x[0-9a-f]+ +0x[0-9a-f]+ +R +0x[48]?
#pass
