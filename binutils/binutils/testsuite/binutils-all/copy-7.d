#PROG: objcopy
#readelf: -tW
#name: copy with unknown section flag
#warning: .*/copy-7[.].*:[.]special: warning: retaining .* 0x10000

There are .* section headers, starting at offset .*

Section Headers:
  \[Nr\].*
#...
  \[ [1-9]\] .special
       PROGBITS .*
       \[0+10000\]: UNKNOWN \(0+10000\)
#...
