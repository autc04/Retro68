#source: tls-gdgotrelm.s --defsym r=8191
#as: --no-underscore --em=criself --pic
#ld: --shared -m crislinux --hash-style=sysv
#objdump: -s -j .got -R

# Verify that the first and last R_CRIS_16_GOT_GD entries are ok just
# below the limit, in a DSO.  Beware, the order here is quite random,
# supposedly depending on symbol hashes.

.*:     file format elf32-cris

DYNAMIC RELOCATION RECORDS
OFFSET   TYPE              VALUE 
000b38bc R_CRIS_DTP        x2814
#...
000b82fc R_CRIS_DTP        x8190
#...
000c12b4 R_CRIS_DTP        x0
#...
000c38ac R_CRIS_DTP        x1345

Contents of section .got:
 b38b0 40380b00 00000000 00000000 00000000  .*
 b38c0 00000000 00000000 00000000 00000000  .*
#...
 c3890 00000000 00000000 00000000 00000000  .*
 c38a0 00000000 00000000 00000000 00000000  .*
 c38b0 00000000                             .*
#PASS
