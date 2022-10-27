#source: tls-x.s
#source: tls-local-59.s
#as: --pic --no-underscore --em=criself -I$srcdir/$subdir
#ld: -m crislinux --shared --hash-style=sysv
#objdump: -s -t -r -p -R -T

# A DSO with a R_CRIS_32_GOT_GD, a R_CRIS_16_GOT_GD, a
# R_CRIS_32_GOT_TPREL and a R_CRIS_16_GOT_TPREL against the same local
# symbol.  Check that we have proper NPTL/TLS markings and GOT.

.*:     file format elf32-cris

Program Header:
#...
     TLS off .*
         filesz 0x00000084 memsz 0x00000084 flags r--
#...
  FLAGS                0x00000010
#...
DYNAMIC RELOCATION RECORDS
OFFSET   TYPE              VALUE 
000022c8 R_CRIS_32_TPREL   \*ABS\*\+0x0+4
000022cc R_CRIS_DTP        \*ABS\*\+0x0+4

Contents of section \.hash:
#...
Contents of section \.text:
 01ac 6fae1000 00006fae 0c000000 5fae1000  .*
 01bc 5fae0c00                             .*
#...
Contents of section \.got:
 22bc 44220+ 0+ 0+ 040+  .*
 22cc 0+ 0+                    .*
