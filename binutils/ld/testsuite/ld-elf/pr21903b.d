#source: pr21903.s
#ld: -shared
#readelf: --dyn-syms
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi

#...
.*: [0-9a-f]+ +4 +OBJECT +GLOBAL +DEFAULT +[0-9]+ foo
#pass
