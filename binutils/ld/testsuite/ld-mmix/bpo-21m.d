#source: start.s
#source: bpo-11.s
#source: bpo-7.s
#as: -linker-allocated-gregs
#ld: -m mmo
#error: ^.*undefined reference to `areg'$

# A BPO reloc against an undefined symbol, with a full set of normal
# BPO:s.
