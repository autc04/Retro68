#source: pr349-1.s
#source: pr349-2.s
#ld: -r
#readelf: -S
#xfail: d30v-*-* dlx-*-* fr30-*-* frv-*-elf ft32-*-* i860-*-* i960-*-*
#xfail: iq*-*-* mn10200-*-* moxie-*-* msp*-*-* mt-*-* pj*-*-*
# if not using elf32.em, you don't get fancy section handling

#...
.* .abcxyz .*
#...
.* .abcxyz .*
#pass
