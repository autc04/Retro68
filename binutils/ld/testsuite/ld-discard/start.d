#source: start.s
#source: exit.s
#ld: -T discard.ld
#error: `data' referenced in section `\.text' of tmpdir/start.o: defined in discarded section `\.data\.exit' of tmpdir/exit.o
#objdump: -p
#xfail: d30v-*-* dlx-*-* i960-*-* pj*-*-*
#xfail: m68hc12-*-* m6812-*-*
#pass
