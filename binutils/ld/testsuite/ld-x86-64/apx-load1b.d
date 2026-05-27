#source: apx-load1.s
#as: --x32 -mrelax-relocations=yes
#ld: -melf32_x86_64 -z max-page-size=0x200000 -z noseparate-code
#objdump: -dw --sym
#dump: apx-load1a.d
