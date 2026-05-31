#source: pr25207.s
#ld: -z separate-code --no-rosegment -Ttext-segment=0x120000 -z max-page-size=0x10000
#readelf: -l --wide
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi
# changing -Ttext-segment behaviour will break --image-base (pr25207)
# -Ttext-segment=<ADDR> should set the first segment address,
# not necessarily the first executable segment.

#...
  LOAD +0x0+ 0x0*120000 0x0*120000 0x[0-9a-f]+ 0x[0-9a-f]+ R   .*
#pass
