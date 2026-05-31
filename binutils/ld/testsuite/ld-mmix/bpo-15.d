#source: start.s
#source: bpo-7.s
#as: -linker-allocated-gregs
#ld: -m elf64mmix
#error: ^.* undefined reference to `areg'$

# A BPO against an undefined symbol.
