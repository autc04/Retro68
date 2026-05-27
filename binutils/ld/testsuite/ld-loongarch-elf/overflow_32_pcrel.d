#source: 32_pcrel.s
#as: -mthin-add-sub
#ld: -shared --section-start=sx=0x80001000 --section-start=sy=0x1000
#error: .*relocation truncated to fit: R_LARCH_32_PCREL against `x'
