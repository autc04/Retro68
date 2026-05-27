#source: sh-link-common.s
#readelf: -t
#notarget: *-*-hpux*
# hpux has a non-standard common directive.

#...
 +\[ *[0-9]+\] +__patchable_function_entries
 +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +COM
 +0+[248] +0+ +0 +[1248]+
 +\[0+83\]: WRITE, ALLOC, LINK ORDER
#pass
