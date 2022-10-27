#ld: --gc-sections -shared
#readelf: -S --wide --dyn-syms
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi
#xfail: d30v-*-* dlx-*-* pj*-*-*
#xfail: hppa64-*-* mep-*-* mn10200-*-*
# generic linker targets don't support --gc-sections, nor do a bunch of others

#...
  \[[ 0-9]+\] \.s?bss[ \t]+NOBITS[ \t0-9a-f]+WA.*
#...
 +[0-9]+: +[0-9a-f]+ +4 +OBJECT +GLOBAL +DEFAULT +[1-9]+ foo
#pass
