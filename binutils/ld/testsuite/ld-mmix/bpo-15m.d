#source: start.s
#source: bpo-7.s
#as: -linker-allocated-gregs
#ld: -m mmo
#error: ^.* undefined reference to `areg'$

# A BPO against an undefined symbol.
