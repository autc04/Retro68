#readelf: -S --wide
#name: section flags (for GNU lto sections)

#...
[ 	]*\[.*\][ 	]+\.gnu\.lto_main[ 	]+PROGBITS.*[ 	]+E[   ]+.*
[ 	]*\[.*\][ 	]+\.gnu\.lto_\.pureconst[ 	]+PROGBITS.*[ 	]+E[   ]+.*
[ 	]*\[.*\][ 	]+\.gnu_object_only[ 	]+GNU_OBJECT_ONLY.*[ 	]+E[   ]+.*
#pass
