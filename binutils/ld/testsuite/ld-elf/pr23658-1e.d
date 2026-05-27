#source: pr23658-1a.s
#source: pr23658-1b.s
#source: pr23658-1c.s
#source: pr23658-1d.s
#source: start.s
#ld: --build-id -z separate-code --rosegment
#readelf: -l --wide
# Since generic linker targets don't place SHT_NOTE sections as orphan,
# SHT_NOTE sections aren't grouped nor sorted.  .note.gnu.build-id is
# placed before text sections and there should no other note sections
# between .note.gnu.build-id and text sections.
#xfail: [uses_genelf]
# The following targets don't support --build-id.
#xfail: cr16-* crx-* visium-*
# The following targets place .note.gnu.build-id in unusual places.
#xfail: *-*-hpux*
#xfail: arc*-* avr-* m68hc1*-* microblaze*-* nds32*-* spu-*-* xstormy16-*-*
#noxfail: microblaze*-linux*

#...
 +[0-9]+ +\.note.gnu.build-id +
#...
 +[0-9]+ +\.note\.4 \.note\.1 +
 +[0-9]+ +\.note\.2 \.note\.3 +
#pass
