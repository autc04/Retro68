#source: compress1.s
#as: --compress-debug-sections=none
#ld: -r --compress-debug-sections=zlib-gnu
#readelf: -SW
#notarget: d30v-*-* dlx-*-* fr30-*-* frv-*-* ft32-*-* i370-*-* i860-*-* iq2000-*-* mn10200-*-* moxie-*-* msp430-*-* mt-*-* or1k-*-* pj-*-*
# Not all ELF targets use the elf.em emulation...

#failif
#...
  \[[ 0-9]+\] \.zdebug_aranges[ 	]+(PROGBITS|MIPS_DWARF)[ 	0-9a-z]+ .*
#...
