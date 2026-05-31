#name: PC-relative relocation making executable
#source: bad_pcala_hi20_global_pie.s
#ld: -pie -z undefs --defsym _start=0
#error: .*: relocation R_LARCH_PCALA_HI20 against `sym` can not be used when making a PIE object; recompile with -mno-direct-extern-access and check the symbol visibility
