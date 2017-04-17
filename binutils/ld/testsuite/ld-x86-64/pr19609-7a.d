#source: pr19609-7.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -Ttext=0x80000000
#error: .*relocation truncated to fit: R_X86_64_PC32 .*
