#objdump : -s -j .data
#name : .quad with division (fwdref)
# bfin doesn't support 'symbol = expression'.
# tic30 and tic4x have 4 octets per byte, tic54x has 2 octets per byte.
# v850 re-purposes .offset.
#notarget: bfin-*-* *c30-*-* *c4x-*-* *c54x-*-* v850*-*-*
# linkrelax targets don't handle equivalence expressions well (nor any
# other forward expression).  mep uses complex relocs.
#xfail: am33*-*-* crx-*-* h8300-*-* mn10200-*-* mn10300-*-* mep-*-*

.*: .*

Contents of section (\.data|\$DATA\$):
 0000 (00000000 80000000|80000000 00000000|00000080 00000000) 00000000 00000000 .*
 00.. (80000000 00000000 00000000 00000000|00000000 00000080 00000000 00000000) .*
#pass
