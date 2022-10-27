#PROG: strip
#strip: -g
#error: \A[^\n]*: unsupported relocation type 0x8f\n
#error:   [^\n]*: bad value\Z
#not-target: h8300-* ip2k-* m6811-* m68hc11-* rx-*
# The H8300-*, IP2K and 68HC11 targets use 16-bit addressing, so `.dc.a'
#  does not work for manual relocation data construction.
# The RX targets do not complain about unrecognised relocs, unless they
#  are actually used
#  (which is what should really happen with the other targets...)
