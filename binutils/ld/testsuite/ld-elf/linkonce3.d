#source: linkonce1a.s
#source: linkonce1b.s
#ld: -r
#objdump: -r
#target: [is_generic]

.*:     file format .*
#...
RELOCATION RECORDS FOR \[.debug_frame\]:
OFFSET[ 	]+TYPE[ 	]+VALUE[ 	]*
.*(NONE|unused|UNUSED).*\*ABS\*

#pass
