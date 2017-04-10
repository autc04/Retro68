#source: pr19609-4.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -Ttext=0x70000000 -Tdata=0xa0000000
#error: .*relocation truncated to fit: R_X86_64_32S .*
#error: .*relocation truncated to fit: R_X86_64_32S .*
