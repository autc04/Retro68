#source: pr12851.s
#source: start.s
#ld: --gc-sections
#readelf: -s --wide
#notarget: d30v-*-* dlx-*-* i960-*-* pj*-*-* pru-*-*
#notarget: hppa64-*-* i370-*-* i860-*-* ia64-*-* mep-*-* mn10200-*-*
# generic linker targets don't support --gc-sections, nor do a bunch of others

#...
 +.* _.stapsdt.base
#pass
