#source: pr17550-2.s
#source: pr17550-3.s
#ld: -r
#error: .*: defined in discarded section `\.data\[foo_group\]'
#notarget: alpha-*-* cr16-*-* crx-*-* d30v-*-* dlx-*-* i960-*-* pj*-*-*
# Disabled on alpha because alpha has a different .set directive.
# cr16 and crx use non-standard scripts with memory regions, which don't
# play well with comdat group sections under ld -r.  Generic linker
# targets don't support comdat group sections.
