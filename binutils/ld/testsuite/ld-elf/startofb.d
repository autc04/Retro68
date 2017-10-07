#source: startof.s
#ld: -shared
#readelf: -sW
#target: *-*-linux* *-*-gnu*

Symbol table '\.dynsym' contains [0-9]+ entries:
 +Num: +Value +Size Type +Bind +Vis +Ndx Name
 +0: 0+ +0 +NOTYPE +LOCAL +DEFAULT +UND +
#...
 +[0-9]+: +[a-f0-9]+ +0 +NOTYPE +LOCAL +DEFAULT +[0-9]+ +.startof.scnfoo
#...
 +[0-9]+: +[a-f0-9]+ +0 +NOTYPE +LOCAL +DEFAULT +[0-9]+ +___?start_scnfoo
#pass
