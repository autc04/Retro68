#source: pr21903.s
#ld: -shared --no-define-common
#readelf: --dyn-syms
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi

#...
.*: 0+0 +0 +OBJECT +GLOBAL +DEFAULT +UND foo
#pass
