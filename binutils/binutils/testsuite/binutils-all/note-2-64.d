#PROG: objcopy
#readelf: --notes --wide
#objcopy: --merge-notes
#name: merge notes section (64-bits)
#source: note-2-64.s

#...
  Owner                 Data size	Description
[ 	]+\$<version>1[ 	]+0x00000008[ 	]+NT_GNU_BUILD_ATTRIBUTE_OPEN[ 	]+Applies from offset 0x100 \(file: note1.s\)
[ 	]+\$<tool>gcc 7.0.1[ 	]+0x00000000[ 	]+NT_GNU_BUILD_ATTRIBUTE_OPEN[ 	]+Applies from offset 0x100
[ 	]+\+<stack prot>true[ 	]+0x00000000[ 	]+NT_GNU_BUILD_ATTRIBUTE_OPEN[ 	]+Applies from offset 0x100
[ 	]+\*<PIC>static[ 	]+0x00000000[ 	]+NT_GNU_BUILD_ATTRIBUTE_OPEN[ 	]+Applies from offset 0x100
[ 	]+\*<ABI>0x0[ 	]+0x00000000[ 	]+NT_GNU_BUILD_ATTRIBUTE_OPEN[ 	]+Applies from offset 0x100
[ 	]+\$<version>1[ 	]+0x00000008[ 	]+NT_GNU_BUILD_ATTRIBUTE_OPEN[ 	]+Applies from offset 0x10. \(file: note2.s\)
[ 	]+!<stack prot>false[ 	]+0x00000000[ 	]+NT_GNU_BUILD_ATTRIBUTE_OPEN[ 	]+Applies from offset 0x10.
[ 	]+\*<PIC>pic[ 	]+0x00000000[ 	]+NT_GNU_BUILD_ATTRIBUTE_FUNC[ 	]+Applies to func at 0x10. \(func: func1\)
#...
