#source: lea1.s
#as: --32 -mrelax-relocations=yes
#ld: -pie -melf_i386
#readelf: -Sw

#failif
#...
[ 	]*\[.*\][ 	]+.*\.got .*
#...
