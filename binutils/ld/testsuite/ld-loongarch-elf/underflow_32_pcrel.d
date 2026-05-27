#source: 32_pcrel.s
#as: -mthin-add-sub
#ld: -shared --section-start=sx=0x1000 --section-start=sy=0x80001001
#error: .*relocation truncated to fit: R_LARCH_32_PCREL against `x'
