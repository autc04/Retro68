#source: tls_ie-01.s
#as: -mcpu=arc700
#ld: -static
#objdump: -s -j .got
#xfail: arc*-*-elf*

[^:]+:     file format elf32-littlearc

Contents of section \.got:
 [0-9a-f]+ 08000000 0c000000 +.+
