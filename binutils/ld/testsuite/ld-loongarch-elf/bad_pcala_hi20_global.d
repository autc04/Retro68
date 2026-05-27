#name: PC-relative relocation making shared
#source: bad_pcala_hi20_global.s
#target: [check_shared_lib_support]
#ld: -shared --defsym global_a=0x10 --defsym global_b=0x20
#error: .*: relocation R_LARCH_PCALA_HI20 against `global_b` can not be used when making a shared object; recompile with -fPIC and check the symbol visibility
