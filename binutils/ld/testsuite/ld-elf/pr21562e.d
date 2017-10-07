#source: pr21562a.s
#ld: -shared -z defs
#readelf: -s -S --wide
#target: *-*-linux* *-*-gnu*

#...
  \[[ 0-9]+\] scnfoo[ \t]+PROGBITS[ \t]+[0-9a-f]+ +[0-9a-f]+ +0*10[ \t]+.*
#...
 +[0-9]+: +[0-9a-f]+ +[0-9a-f]+ +NOTYPE +LOCAL +DEFAULT +[0-9]+ +___?start_scnfoo
#pass
