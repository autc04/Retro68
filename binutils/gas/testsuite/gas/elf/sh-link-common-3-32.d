#source: sh-link-common.s
#readelf: -S
#notarget: *-*-hpux*
# hpux has a non-standard common directive.

#...
 +\[ *[0-9]+\] +__patchable_\[\.\.\.\] +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+[248] +0+ +WAL +COM +0 +[1248]+
#pass
