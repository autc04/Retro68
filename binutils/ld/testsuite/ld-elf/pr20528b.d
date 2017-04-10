#source: pr20528b.s
#source: pr20528a.s
#ld: -r
#readelf: -S --wide
#xfail: d30v-*-* dlx-*-* fr30-*-* frv-*-elf ft32-*-* i860-*-* i960-*-*
#xfail: iq*-*-* mn10200-*-* moxie-*-* msp*-*-* mt-*-* pj*-*-*

#...
[ 	]*\[.*\][ 	]+\.text.startup[ 	]+PROGBITS.*[ 	]+AXE[   ]+.*
#...
[ 	]*\[.*\][ 	]+\.text.startup[ 	]+PROGBITS.*[ 	]+AX[   ]+.*
#pass
