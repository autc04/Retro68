#source: orphan-10.s
#ld: -N -T orphan-9.ld
#objdump: -h
#notarget: d30v-* dlx-* fr30-* frv-* ft32-* i860-* i960-* iq2000-* mn10200-* moxie-* ms1-* msp430-* mt-* pj-*

#...
  . \.text         0+(08|10)  [0-9a-f]+  0+200 .*
#...
  . \.data\.1       0+8  [0-9a-f]+  0+300 .*
#pass
