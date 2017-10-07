#PROG: objcopy
#readelf: --relocs
#objcopy: --merge-notes
#name: MIPS merge notes section relocations (n64)
#as: -64 -mips3
#source: ../note-2-64.s

Relocation section '\.rela\.gnu\.build\.attributes' at offset .* contains 2 entries:
  Offset          Info           Type           Sym\. Value    Sym\. Name \+ Addend
000000000010  ....00000012 R_MIPS_64         0000000000000100 note1\.s \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000070  ....00000012 R_MIPS_64         0000000000000104 note2\.s \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
