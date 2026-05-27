#source: sh-link-large-common.s
#readelf: -SW
#target: x86_64-*-*

#...
 +\[ *[0-9]+\] +__patchable_function_entries +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+[248] +0+ +WAL +LARGE_COM +0 +1
#pass
