#readelf: -SW
#name: sections with entity size

#...
[ 	]*\[.*\][ 	]+\.merge[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+0+18[ 	]+0c[ 	]+AM[ 	].*
[ 	]*\[.*\][ 	]+\.string[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+0+6[ 	]+02[ 	]+AS[ 	].*
[ 	]*\[.*\][ 	]+\.custom[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+0+c[ 	]+06[ 	]+A[ 	].*
[ 	]*\[.*\][ 	]+\.bss\.custom[ 	]+NOBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+0+1e[ 	]+06[ 	]+WA[ 	].*
#pass
