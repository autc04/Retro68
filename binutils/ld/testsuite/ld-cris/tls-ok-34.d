#source: tls-gottprelm.s --defsym r=8189
#as: --no-underscore --em=criself --pic
#ld: --shared -m crislinux --hash-style=sysv
#objdump: -s -j .got -R

# Check that a R_CRIS_16_DTPREL just below the theoretical limit
# works.  Verify that the first and last R_CRIS_16_GOT_TPREL entries
# are ok, in a DSO.  Beware, the order here is quite random,
# supposedly depending on symbol hashes.

.*:     file format elf32-cris

DYNAMIC RELOCATION RECORDS
OFFSET   TYPE              VALUE 
000b381c R_CRIS_32_TPREL   x2814
#...
000b4808 R_CRIS_32_TPREL   x8188
#...
000ba510 R_CRIS_32_TPREL   x0
#...
000bb80c R_CRIS_32_TPREL   x1345

Contents of section .got:
 b3810 98370b00 00000000 00000000 00000000  .*
 b3820 00000000 00000000 00000000 00000000  .*
#...
 bb7f0 00000000 00000000 00000000 00000000  .*
 bb800 00000000 00000000 00000000 00000000  .*
