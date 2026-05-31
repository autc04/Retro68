#source: sh-link-large-common.s
#readelf: -t
#target: x86_64-*-*

#...
 +\[ *[0-9]+\] +__patchable_function_entries
 +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +LARGE_COM
 +0+[248] +0+ +0 +1
 +\[0+83\]: WRITE, ALLOC, LINK ORDER
#pass
