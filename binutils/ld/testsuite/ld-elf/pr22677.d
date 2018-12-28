#ld: -r  --gc-sections -u foo
#readelf: -S --wide
#xfail: d30v-*-* dlx-*-* pj*-*-* pru-*-*
#xfail: hppa64-*-* mep-*-* mn10200-*-*
#xfail: cr16-*-* crx-*-* msp430-*-*
# msp430 puts the init_array and fini_array inside the .rodata section.
# generic linker targets don't support --gc-sections, nor do a bunch of
# others.
# cr16 and crx use non-standard scripts with memory regions, which don't
# play well with unique group sections under ld -r.

#...
  \[[ 0-9]+\] \.preinit_array\.01000[ \t]+PREINIT_ARRAY[ \t0-9a-f]+WA?.*
#...
  \[[ 0-9]+\] \.init_array\.01000[ \t]+INIT_ARRAY[ \t0-9a-f]+WA?.*
#...
  \[[ 0-9]+\] \.fini_array\.01000[ \t]+FINI_ARRAY[ \t0-9a-f]+WA?.*
#pass
