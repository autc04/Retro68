#ld: --gc-sections -shared -version-script pr13195.t
#readelf: -s --wide -D
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi
#xfail: d30v-*-* dlx-*-* pj*-*-*
#xfail: hppa64-*-* mep-*-* mn10200-*-*
# generic linker targets don't support --gc-sections, nor do a bunch of others

#...
 +[0-9]+ +[0-9]+: +[0-9a-f]+ +[0-9]+ +FUNC +GLOBAL +DEFAULT +[1-9]+ foo
#pass
