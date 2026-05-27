#source: sh-link-abs.s
#readelf: -tW
#notarget: alpha*-*-*
# .set directive doesn't work on alpha ports.

#...
 +\[ *[0-9]+\] +__patchable_function_entries
 +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+[248] +0+ +ABS +0 +[1248]+
 +\[0+83\]: WRITE, ALLOC, LINK ORDER
#pass
