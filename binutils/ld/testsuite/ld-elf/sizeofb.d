#source: sizeof.s
#ld: -shared
#readelf: -sW
#target: *-*-linux* *-*-gnu*

Symbol table '\.dynsym' contains [0-9]+ entries:
 +Num: +Value +Size Type +Bind +Vis +Ndx Name
 +0: 0+ +0 +NOTYPE +LOCAL +DEFAULT +UND +
#...
 +[0-9]+: +[a-f0-9]+ +0 +NOTYPE +LOCAL +DEFAULT +[0-9]+ +___?stop_scnfoo
#...
 +[0-9]+: 0+10 + +0 +NOTYPE +LOCAL +DEFAULT +ABS +.sizeof.scnfoo
#pass
