#source: pr19609-6.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 --defsym foobar=0x80000000
#error: failed to convert GOTPCREL relocation; relink with --no-relax
