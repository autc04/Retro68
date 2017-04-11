#source: orphan3a.s
#source: orphan3b.s
#source: orphan3c.s
#source: orphan3d.s
#source: orphan3e.s
#source: orphan3f.s
#ld:
#readelf: -S --wide
#xfail: "d30v-*-*" "dlx-*-*" "fr30-*-*" "frv-*-elf" "ft32-*-*"
#xfail: "i860-*-*" "i960-*-*" "iq2000-*-*" "mn10200-*-*" "msp430-*-*" "mt-*-*"
#xfail: "pj-*-*"
#xfail: "xstormy16-*-*"

#...
  \[[ 0-9]+\] \.foo +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+20 +0+ +A +0 +0 +[0-9]+
#...
  \[[ 0-9]+\] \.foo +NOBITS +[0-9a-f]+ +[0-9a-f]+ +0+20 +0+ +A +0 +0 +[0-9]+
#...
  \[[ 0-9]+\] \.foo +PROGBITS +0+ +[0-9a-f]+ +0+20 +0+ +0 +0 +[0-9]+
  \[[ 0-9]+\] [._][^f].*
#pass
