#source: pr21562b.s
#ld: -shared -z defs --gc-sections -T pr21562c.t
#readelf: -s -S --wide
#target: *-*-linux* *-*-gnu*
#xfail: d30v-*-* dlx-*-* i960-*-* pj*-*-*
#xfail: hppa64-*-* i370-*-* i860-*-* ia64-*-* mep-*-* mn10200-*-*
# generic linker targets don't support --gc-sections, nor do a bunch of others

#...
  \[[ 0-9]+\] \.foo[ \t]+PROGBITS[ \t]+[0-9a-f]+ +[0-9a-f]+ +0*10[ \t]+.*
#...
 +[0-9]+: +[0-9a-f]+ +[0-9a-f]+ +NOTYPE +LOCAL +DEFAULT +[0-9]+ +___?stop_scnfoo
#pass
