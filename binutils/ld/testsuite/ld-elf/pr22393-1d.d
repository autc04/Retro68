#source: pr22393-1.s
#ld: -pie -z separate-code
#readelf: -l --wide
#target: *-*-linux-gnu *-*-gnu* *-*-nacl* arm*-*-uclinuxfdpiceabi

#failif
#...
 +[0-9]+  +.*.text.*(.eh_frame|\.rodata).*
#...
