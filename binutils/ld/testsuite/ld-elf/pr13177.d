#source: pr13177.s
#ld: --gc-sections -shared
#readelf: -s -D --wide
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi
#xfail: d30v-*-* dlx-*-* pj*-*-*
#xfail: hppa64-*-* mep-*-* mn10200-*-*
# generic linker targets don't support --gc-sections, nor do a bunch of others

#failif
#...
.*: 0+0 +0 +NOTYPE +GLOBAL +DEFAULT +UND bar
#...
