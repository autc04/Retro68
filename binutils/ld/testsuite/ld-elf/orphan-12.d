#source: orphan-12.s
#ld: -T orphan-11.ld --strip-debug --orphan-handling=error
#objdump: -wh
#notarget: d30v-* dlx-* fr30-* frv-* ft32-* iq2000-* mn10200-* moxie-* ms1-* msp430-* mt-* pj-*

#...
  . \.text .*
  . \.data .*
#pass
