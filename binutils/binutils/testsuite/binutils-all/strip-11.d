#PROG: strip
#source: empty.s
#strip: -g
#readelf: -S --wide
#name: strip -g empty file

#...
  \[ 0\] +NULL +0+ .*
#...
  \[ .\] \.shstrtab +STRTAB +0+ .*
Key to Flags:
#pass
