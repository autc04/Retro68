#readelf: -SW
#name: string sections
#warning: (.*missing merge / string entity size, 1 assumed)?

#...
[ 	]*\[.*\][ 	]+\.str1[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+01[ 	]+S[ 	]+.*
[ 	]*\[.*\][ 	]+\.str2[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+01[ 	]+S[ 	]+.*
[ 	]*\[.*\][ 	]+\.str3[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+01[ 	]+S[ 	]+.*
[ 	]*\[.*\][ 	]+\.str4[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+02[ 	]+S[ 	]+.*
[ 	]*\[.*\][ 	]+\.rodata\.str[ 	]+PROGBITS[ 	]+0+[ 	]+[0-9a-f]+[ 	]+[0-9a-f]+[ 	]+01[ 	]+AMS[ 	]+.*
#pass
