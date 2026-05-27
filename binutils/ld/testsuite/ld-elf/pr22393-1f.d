#source: pr22393-1.s
#ld: -z separate-code
#readelf: -l --wide
#target: *-*-linux-gnu *-*-gnu* arm*-*-uclinuxfdpiceabi
#xfail: rx-*-linux*

#failif
#...
 +[0-9]+  +.*.text.*(.eh_frame|\.rodata).*
#...
