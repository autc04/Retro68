#ld: -z separate-code --no-rosegment
#objcopy_linked_file: -R .foo
#readelf: -lW
#target: *-*-linux-gnu *-*-gnu* arm*-*-uclinuxfdpiceabi
#xfail: mips*-*-* rx-*-linux*

#...
 Section to Segment mapping:
  Segment Sections...
#...
   0.     
#...
   0.     .text 
#pass
