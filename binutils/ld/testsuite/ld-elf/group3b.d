#source: group3b.s
#source: group3a.s
#ld: -T group.ld
#readelf: -s
#xfail: d30v-*-* dlx-*-* i960-*-* pj*-*-*
# generic linker targets don't comply with all symbol merging rules

Symbol table '.symtab' contains .* entries:
#...
.*: 0+1000 +0 +OBJECT +GLOBAL +HIDDEN +. foo
#...
