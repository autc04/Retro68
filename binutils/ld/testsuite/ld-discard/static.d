#source: static.s
#ld: -T discard.ld
#error: `(\.data\.exit|data)' referenced in section `\.text' of tmpdir/static.o: defined in discarded section `\.data\.exit' of tmpdir/static.o
#objdump: -p
#xfail: d30v-*-* dlx-*-* i960-*-* pj*-*-*
#xfail: m68hc12-*-* m6812-*-*
#pass
