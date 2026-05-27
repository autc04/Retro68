#ld: -shared --version-script $srcdir/$subdir/pr33599.map
#readelf : --dyn-syms --wide
#target: *-*-linux* *-*-gnu* *-*-solaris* arm*-*-uclinuxfdpiceabi
#xfail: ![check_shared_lib_support]

Symbol table '\.dynsym' contains [0-9]+ entries:
#...
 +[0-9]+: +[0-9a-f]+ +[0-9a-f]+ +OBJECT +GLOBAL +DEFAULT +[0-9]+ +bar
#...
 +[0-9]+: +[0-9a-f]+ +[0-9a-f]+ +OBJECT +GLOBAL +DEFAULT +[0-9]+ +foo@
#pass
