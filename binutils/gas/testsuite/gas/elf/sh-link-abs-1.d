#source: sh-link-abs.s
#readelf: -SW
#notarget: alpha*-*-*
# .set directive doesn't work on alpha ports.

#...
 +\[ *[0-9]+\] +__patchable_function_entries +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+[248] +0+ +WAL +ABS +0 +[1248]+
#pass
