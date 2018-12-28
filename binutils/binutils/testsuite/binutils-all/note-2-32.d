#PROG: objcopy
#readelf: --notes --wide
#objcopy: --merge-notes
#name: merge notes section (32-bits)
#source: note-2-32.s

#...
  Owner                 Data size	Description
[ 	]+\$<version>1[ 	]+0x00000004[ 	]+OPEN[ 	]+Applies to region from 0x100 \(note1.s\)
[ 	]+\$<tool>gcc 7.0.1[ 	]+0x00000000[ 	]+OPEN[ 	]+Applies to region from 0x100
[ 	]+\+<stack prot>true[ 	]+0x00000000[ 	]+OPEN[ 	]+Applies to region from 0x100
[ 	]+\*<PIC>static[ 	]+0x00000000[ 	]+OPEN[ 	]+Applies to region from 0x100
[ 	]+\*<ABI>0x0[ 	]+0x00000000[ 	]+OPEN[ 	]+Applies to region from 0x100
[ 	]+\$<version>1[ 	]+0x00000004[ 	]+OPEN[ 	]+Applies to region from 0x104 \(note2.s\)
[ 	]+!<stack prot>false[ 	]+0x00000000[ 	]+OPEN[ 	]+Applies to region from 0x104
[ 	]+\*<PIC>pic[ 	]+0x00000004[ 	]+func[ 	]+Applies to region from 0x104 \(func1\)
#...
