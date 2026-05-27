#as: --gsframe=no
#readelf: -S
#name: No SFrame section with explicit --gsframe=no
#failif
[ 	]*\[.*\][ 	]+\.sframe[ 	]+GNU_SFRAME.*
