#name: PC-relative relocation making executable
#source: bad_pcala_hi20_weak_pie.s
#ld: -pie --defsym _start=0
#error: .*: relocation R_LARCH_PCALA_HI20 against `sym` can not be used when making a PIE object; recompile with -mno-direct-extern-access and check the symbol visibility
