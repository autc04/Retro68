#PROG: strip
#source: bintest.s
#strip: --strip-unneeded
#nm: -n
#not-target: *-*-aix* *-*-linuxecoff
#name: strip --strip-unneeded on common symbol

#...
0+04 C common_symbol
#pass
